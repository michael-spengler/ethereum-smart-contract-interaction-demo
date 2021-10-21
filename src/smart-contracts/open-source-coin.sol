// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.4/contracts/token/ERC20/ERC20.sol";

contract OpenSourceCoin is ERC20 { 
    
    constructor () ERC20("OpenSourceCoin", "OSC") { 

    }
    
    struct Entry { 
        string programmingLanguage;
        string topicArea;
        string name;
        string version;
        string content;
        address ethereumWalletAddressOfContributor;
    }

    struct Proposal { 
        string programmingLanguage;
        string topicArea;
        string name;
        string version;
        string content;
        address ethereumWalletAddressOfContributor;
        uint256 OSCAtRiskForProposal;
    }


    struct Bet {
        string programmingLanguage;
        string topicArea;
        string name;
        string version;
        uint256 amountBettedOnProposal;
    }

    struct Voter {
        address ethereumWalletAddressOfVoter;
        Bet[] listOfBets;
    }
    
    
    Entry[] entries;
    Proposal[] proposals;
    Bet[] bets;
    Voter[] voters;
    
    uint256 stakingPool = 0;

    // Example Input: 'TypeScript', 'tutorials','hello-world.ts','v0.0.1',`console.log('hello world :)')`, '0x7A915e362353d72570dcf90aa5BAA1C5B341c7AA'
    // Example Input: 'TypeScript', 'volatility-farming','long-short-btc-exploit.ts','v0.0.1',`the magic code...`, '0x7A915e362353d72570dcf90aa5BAA1C5B341c7AA'
    function addProposal(string memory programmingLanguage, string memory topicArea, string memory name, string memory version, string memory content, address ethereumWalletAddressOfContributor) public payable {
        // might be needed: https://ethereum.stackexchange.com/questions/106801/how-to-code-a-string-replace-function-in-solidity
        // address sender = msg.sender;
        // uint256 amountOfEther ;
        
        // get exchange rate ETHOSC from uniswap 
        
        uint256 amountOfOSC = 1;
        
        if (amountOfOSC < 1) {
            // throw error
        }
        
        proposals.push(Proposal(programmingLanguage, topicArea, name, version, content, ethereumWalletAddressOfContributor, amountOfOSC));
    }
    
    
    function voteOnProposal(string memory programmingLanguage, string memory topicArea, string memory name, string memory version, uint256 amountToBeBettedOnTheValidityOfContribution) public {

        // Bet memory bet = Bet(programmingLanguage, topicArea, name, version, amountToBeBettedOnTheValidityOfContribution);
        
        for (uint i = 0; i < proposals.length; i++) {
            
            if (compareStrings(proposals[i].programmingLanguage, programmingLanguage) && 
                compareStrings(proposals[i].topicArea, topicArea) && 
                compareStrings(proposals[i].name, name) && 
                compareStrings(proposals[i].version, version)){
                
                proposals[i].OSCAtRiskForProposal = proposals[i].OSCAtRiskForProposal + amountToBeBettedOnTheValidityOfContribution;
                
                // option 1: 
                uint256 numberOfOpenProposals = proposals.length - entries.length;
                
                uint256 minimumOSCAtRiskForDecision = totalSupply() / 10 / numberOfOpenProposals;
                
                if (proposals[i].OSCAtRiskForProposal > minimumOSCAtRiskForDecision) {
                    entries.push(Entry(proposals[i].programmingLanguage, proposals[i].topicArea, proposals[i].name, proposals[i].version, proposals[i].content, proposals[i].ethereumWalletAddressOfContributor));
                    _mint(proposals[i].ethereumWalletAddressOfContributor, 2 * (10 ** uint256(decimals())));
                }
            }

        }
    }
    
    
    function getContent(string memory programmingLanguage, string memory topicArea, string memory name, string memory version) public view returns (string memory) {
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[i].programmingLanguage, programmingLanguage) && 
                compareStrings(entries[i].topicArea, topicArea) && 
                compareStrings(entries[i].name, name) && 
                compareStrings(entries[i].version, version)){
                
             return entries[i].content;            
             
            }

        }
        
        return "";
    }
    
    
     function getLatestVersion() public view returns (string memory) {
        string memory version = entries[0].version;
        return version;
    }
    
    
    function compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}
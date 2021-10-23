// SPDX-License-Identifier: MIT
// option 1: make osc deflationäry  
// problems: costs shall never become too high --> logarithmic price per entry increase

// Der Strategy- & Pool Explorer könnte einfach 
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
        address payable ethereumWalletAddressOfContributor;
        uint256 weiEarned; 
    }


    Entry[] entries;

    // Example Input: 'TypeScript', 'volatility-farming-strategy','long-short-btc-exploit.ts','v0.0.1',`the magic code...`
    function addEntry(string memory programmingLanguage, string memory topicArea, string memory name, string memory version, string memory content) public payable {
        // might be needed: https://ethereum.stackexchange.com/questions/106801/how-to-code-a-string-replace-function-in-solidity
        
        string memory potentialErrorMessage = string(abi.encodePacked("adding an entry costs", getCurrentCostForAddingAnEntry(), "Wei to protect the system"));
        uint currentCost = getCurrentCostForAddingAnEntry();
        
        require(msg.value == currentCost, potentialErrorMessage);
        
        
        entries.push(Entry(programmingLanguage, topicArea, name, version, content, payable(msg.sender), 0));

        _mint(msg.sender, 2 * (10 ** uint256(decimals())));
        
        if (getBalanceInContract() >=10000000000000) {
            // add the ether to the ETHOSC liquidity pool https://docs.uniswap.org/sdk/guides/liquidity/adding
        }
        
    }
    

    function getCurrentCostForAddingAnEntry() public pure returns (uint) {
        // get the exchange rate ETHOSC from uniswap or 
        // implement logarithmic function 
        return 1000000000000;
    }
    
    function getBalanceInContract() public view returns (uint) {
        return address(this).balance;
    }
    

    // Example Input: 'TypeScript', 'tutorials','hello-world.ts','v0.0.1'
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
    

    // Example Input: 'TypeScript', 'tutorials','hello-world.ts','v0.0.1'
    function rewardContributor(string memory programmingLanguage, string memory topicArea, string memory name, string memory version) public payable {
        
        require(msg.value >= 10000000000, "a reward shall be at least 10000000000 Wei");
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[i].programmingLanguage, programmingLanguage) && 
                compareStrings(entries[i].topicArea, topicArea) && 
                compareStrings(entries[i].name, name) && 
                compareStrings(entries[i].version, version)){
                
                entries[i].ethereumWalletAddressOfContributor.transfer(msg.value);
                entries[i].weiEarned = entries[i].weiEarned + msg.value;
             
            }

        }
        
    }
    
    // Example Input: 'TypeScript', 'volatility-farming-strategy','hello-world.ts','v0.0.1'
    function getEntry(string memory programmingLanguage, string memory topicArea, string memory name, string memory version) public view returns (Entry memory) {
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[i].programmingLanguage, programmingLanguage) && 
                compareStrings(entries[i].topicArea, topicArea) && 
                compareStrings(entries[i].name, name) && 
                compareStrings(entries[i].version, version)){
                
                return entries[i];

            }
        }
        
        return Entry("", "", "","", "", payable(address(this)), 0);
    }
    
    
    function getEntries() public view returns (Entry[] memory) {

        return entries;    
        
    }
    
    // Example Input: 'volatility-farming-strategy'
    function getEntriesForTopicArea(string memory topicArea) public view returns (Entry[] memory) {

        uint targetArraySize = 0;
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[i].topicArea, topicArea)){
                targetArraySize = targetArraySize + 1;
            }
        }
        
        Entry[] memory relevantEntries = new Entry[](targetArraySize);
        uint counter = 0;
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[i].topicArea, topicArea)){
                relevantEntries[counter] = entries[i];

                counter = counter + 1;
            }
        }

        return relevantEntries;    
        
    }
    
    function getLatestVersion() public view returns (string memory) {
        string memory version = entries[0].version;
        return version;
    }
    
    
    function compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
    
}
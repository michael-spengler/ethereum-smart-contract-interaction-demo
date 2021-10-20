// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract CodeFileRepository {
    
    struct Entry { 
        string programmingLanguage;
        string topicArea;
        string name;
        string version;
        string content;
        string ethereumWalletAddressOfContributor;
    }
    
    
    Entry[] entries;


    // Example Input: 'TypeScript', 'tutorials','hello-world.ts','v0.0.1',`console.log('hello world :)')`, '0x7A915e362353d72570dcf90aa5BAA1C5B341c7AA'
    function addEntry(string memory programmingLanguage, string memory topicArea, string memory name, string memory version, string memory content, string memory ethereumWalletAddressOfContributor) public {
        // might be needed: https://ethereum.stackexchange.com/questions/106801/how-to-code-a-string-replace-function-in-solidity
        entries.push(Entry(programmingLanguage, topicArea, name, version, content, ethereumWalletAddressOfContributor));
    }

    // example input: 'TypeScript','tutorials','hello-world.ts','v0.0.1'
    function getContent(string memory programmingLanguage, string memory topicArea, string memory name, string memory version) public view returns (string memory) {
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[0].programmingLanguage, programmingLanguage) && 
                compareStrings(entries[0].topicArea, topicArea) && 
                compareStrings(entries[0].name, name) && 
                compareStrings(entries[0].version, version)){
                
             return entries[0].content;            
             
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
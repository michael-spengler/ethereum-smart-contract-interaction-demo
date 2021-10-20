// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract CodeFileRepository {
    
    struct Entry { 
        string programmingLanguage;
        string projectName;
        string version;
        string name;
        string content;
        string ethereumWalletAddressOfContributor;
    }
    
    
    Entry[] entries;


    function addEntry(string memory programmingLanguage, string memory projectName, string memory version, string memory name, string memory content, string memory ethereumWalletAddressOfContributor) public {
        // might be needed: https://ethereum.stackexchange.com/questions/106801/how-to-code-a-string-replace-function-in-solidity
        // Example Input: 'TypeScript', 'basics', 'v0.0.1', 'hello-world.ts', `console.log('hello world :)')`, '0x7A915e362353d72570dcf90aa5BAA1C5B341c7AA'
        entries.push(Entry(programmingLanguage, projectName, version, name, content, ethereumWalletAddressOfContributor));
    }

    function getContent(string memory programmingLanguage, string memory projectName, string memory version, string memory name) public view returns (string memory) {
        
        for (uint i = 0; i < entries.length; i++) {
            if (compareStrings(entries[0].programmingLanguage, programmingLanguage) && 
                compareStrings(entries[0].projectName, projectName) && 
                compareStrings(entries[0].version, version) && 
                compareStrings(entries[0].name, name)){
                
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
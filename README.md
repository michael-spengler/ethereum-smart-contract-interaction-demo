# ethereum-smart-contract-interaction-demo


## Demo basic.sol interaction

```sh
git clone https://github.com/michael-spengler/ethereum-smart-contract-interaction-demo.git
cd ethereum-smart-contract-interaction-demo
ts-node src/basic-sol-interaction-demo.ts 

```



## How we developed the Demo basic.sol
## Connect to Ropsten Testnet
![Screenshot 2021-10-19 at 19 34 04](https://user-images.githubusercontent.com/43786652/137961975-020a3c42-6e59-46d8-a704-c71a2d060565.png)


## Get Ether on Ropsten
https://faucet.ropsten.be/


## Choose an Ethereum Connector
### Option 1: Run your own node and connect to it
https://ethereum.org/en/developers/docs/nodes-and-clients/run-a-node/

### Option 2: Use https://infura.io/

### Option 3: Use http://85.214.129.69:8545
Accounts with addresses `0x7e373834f8faBd1e26cf6466b580615f9F45a791` and `0x8E0A4827a1B5833415c64bBFA745f4084bC5183E`
can be used without a passphrase and have some ether to play around. These two can be used in the Remix IDE, as (in my case) the passphrase method doesn't work.
If you need an account with ether, then write it in the group, so I can provide a public and private key.
When using it in the Remix IDE, the URL has to be `http://remix...`, else it won't connect to the RPC. 


## Use ABI (Application Binary Interface)
Use the ABI of your smart contract in your TypeScript code

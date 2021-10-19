require('dotenv').config() // this ensures process.env. ... contains your .env file configuration values

const Web3 = require('web3');

const web3 = new Web3(new Web3.providers.HttpProvider(process.env.PROVIDER_URL));
const fromWalletAddress = process.env.SENDER_WALLET_ADDRESS
const toWalletAddress = process.env.RECEIVER_WALLET_ADDRESS
const amountInETH = 1
const senderPrivateKey = process.env.SENDER_WALLET_PRIVATE_KEY

console.log(`we will transfer ${amountInETH} ETH from ${fromWalletAddress} to ${toWalletAddress} - using privatekey 123 ;)`)



require('dotenv').config() // this ensures process.env. ... contains your .env file configuration values
const Web3 = require('web3');

import { basicSolABI } from "../abis/basic-sol-abi"

const web3 = new Web3(new Web3.providers.HttpProvider(process.env.PROVIDER_URL));

const smartContractAddressOnRopsten = "0xf1497128cdb01fbf249e413bf633125d807cfdb4"
const ourContract = new web3.eth.Contract(basicSolABI, smartContractAddressOnRopsten)

console.log(ourContract.methods)


setTimeout(async () => {


    // write access needs to be checked

    const dataFromSmartContract = await ourContract.methods.getData().call();

    console.log(dataFromSmartContract)

}, 1)
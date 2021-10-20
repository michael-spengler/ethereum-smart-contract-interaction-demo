
require('dotenv').config() // this ensures process.env. ... contains your .env file configuration values
const Web3 = require('web3');
import { codeRegistryABI } from "../abis/code-registry-abi"


export class CodeRegistryService {

    // private smartContractAddressOnMainnet = "tbd"
    private smartContractAddressOnRopsten = "0x05769174391e6be0a5eB1f58F51a89B288441771"

    private web3
    private ourContract

    // console.log(ourContract.methods)


    public constructor() {
        this.web3 = new Web3(new Web3.providers.HttpProvider(process.env.PROVIDER_URL));
        this.ourContract = new this.web3.eth.Contract(codeRegistryABI, this.smartContractAddressOnRopsten)
    }

    public async getContent(): Promise<string> {

        const content = await this.ourContract.methods.getContent().call();
        console.log(`the content is ${content} `)

        return content

    }

    public async getLatestVersion(): Promise<string> {
        const latestVersion = await this.ourContract.methods.getLatestVersion().call();
        console.log(`the latest version is: ${latestVersion} `)

        return latestVersion
    }

}
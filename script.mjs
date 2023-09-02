// Replace this with your Web3 initialization code
import Web3 from 'web3';
const web3 = new Web3('https://goerli.infura.io/v3/14403cbbfb564c6387b7bab9f7d7a3b2');

const contractAddress = '0x4a5cD7d78015B97ECD1F4DC0a99f3CD4c1d6f49A'; // Replace with your contract address
const contractABI = [{
    "anonymous": false,
    "inputs": [
        {
            "indexed": true,
            "internalType": "address",
            "name": "borrower",
            "type": "address"
        },
        {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }
    ],
    "name": "Borrow",
    "type": "event"
},
{
    "anonymous": false,
    "inputs": [
        {
            "indexed": true,
            "internalType": "address",
            "name": "borrower",
            "type": "address"
        },
        {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }
    ],
    "name": "Liquidate",
    "type": "event"
},
{
    "anonymous": false,
    "inputs": [
        {
            "indexed": true,
            "internalType": "address",
            "name": "borrower",
            "type": "address"
        },
        {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }
    ],
    "name": "Repay",
    "type": "event"
},
{
    "inputs": [
        {
            "internalType": "address",
            "name": "",
            "type": "address"
        }
    ],
    "name": "balances",
    "outputs": [
        {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
        }
    ],
    "stateMutability": "view",
    "type": "function"
},
{
    "inputs": [
        {
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }
    ],
    "name": "borrow",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
},
{
    "inputs": [
        {
            "internalType": "address",
            "name": "borrower",
            "type": "address"
        }
    ],
    "name": "calculateInterest",
    "outputs": [
        {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
        }
    ],
    "stateMutability": "view",
    "type": "function"
},
{
    "inputs": [
        {
            "internalType": "address",
            "name": "",
            "type": "address"
        }
    ],
    "name": "collateral",
    "outputs": [
        {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
        }
    ],
    "stateMutability": "view",
    "type": "function"
},
{
    "inputs": [],
    "name": "depositCollateral",
    "outputs": [],
    "stateMutability": "payable",
    "type": "function"
},
{
    "inputs": [
        {
            "internalType": "address",
            "name": "borrower",
            "type": "address"
        }
    ],
    "name": "liquidate",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
},
{
    "inputs": [
        {
            "internalType": "address",
            "name": "",
            "type": "address"
        }
    ],
    "name": "loans",
    "outputs": [
        {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
        }
    ],
    "stateMutability": "view",
    "type": "function"
},
{
    "inputs": [
        {
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }
    ],
    "name": "repay",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
},
{
    "inputs": [],
    "name": "staticInterestRate",
    "outputs": [
        {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
        }
    ],
    "stateMutability": "view",
    "type": "function"
}]; // Replace with your contract ABI

const contract = new web3.eth.Contract(contractABI, contractAddress);

async function updateContractData() {
    const accounts = await web3.eth.getAccounts();
    const senderAddress = accounts[0];

    const borrowerBalance = await contract.methods.balances(senderAddress).call();
    const borrowedAmount = await contract.methods.loans(senderAddress).call();

    document.getElementById('borrower-balance').textContent = web3.utils.fromWei(borrowerBalance, 'ether');
    document.getElementById('borrowed-amount').textContent = web3.utils.fromWei(borrowedAmount, 'ether');
}

async function depositCollateral() {
    const amount = document.getElementById('deposit-amount').value;
    const senderAddress = (await web3.eth.getAccounts())[0];
    console.log(senderAddress);
    await contract.methods.depositCollateral().send({ from: senderAddress, value: web3.utils.toWei(amount, 'ether') });

    updateContractData();
}

async function borrow() {
    const amount = document.getElementById('borrow-amount').value;
    const senderAddress = (await web3.eth.getAccounts())[0];

    await contract.methods.borrow(web3.utils.toWei(amount, 'ether')).send({ from: senderAddress });

    updateContractData();
}

async function repay() {
    const amount = document.getElementById('repay-amount').value;
    const senderAddress = (await web3.eth.getAccounts())[0];

    await contract.methods.repay(web3.utils.toWei(amount, 'ether')).send({ from: senderAddress });

    updateContractData();
}

async function liquidate() {
    const senderAddress = (await web3.eth.getAccounts())[0];

    await contract.methods.liquidate(senderAddress).send({ from: senderAddress });

    updateContractData();
}

updateContractData();

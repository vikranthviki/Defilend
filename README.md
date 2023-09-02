# Defilend
A web app for borrowing and lending on the Ethereum network
cont.sol is the smart contract file 
index.html style.css and script.mjs are files for front end 
in first cont1.sol a basic fully functionality borrowing and lending with static interest rates u need to enter address in script.mjs the front end borrow repay and lend buttons for respective  usages

features improvement cont2.sol (not tested)
## Features

1. Lenders can lend a specified amount of tokens and provide collateral.
2. Borrowers can borrow tokens by providing collateral.
3. Borrowers can repay their debts.
4. The smart contract enforces a static interest rate on borrowed amounts.
5. Lenders and borrowers have credit scores to track their history.
6. Lenders and borrowers are matched based on a hierarchy: highest lender, extensive collateral, and credit score.

## Prerequisites

- Ethereum Wallet or MetaMask extension installed in your browser.
- Some test Ethereum (ETH) or test tokens to interact with the smart contract on the Ropsten test network.

## Deployment

1. Deploy the Smart Contract:
   - Deploy the `LendingPlatform` smart contract on the Ethereum network using Remix, Hardhat, or any other preferred development environment.

2. Interacting with the Smart Contract:
   - Connect your Ethereum wallet or MetaMask to the Ropsten test network.
   - Access the deployed smart contract using its address.

## Using the Smart Contract

1. Lending:
   - Call the `lend` function by providing the amount of tokens you want to lend and the collateral amount.
   - Tokens will be transferred from your wallet to the smart contract.
   - You become an active lender.
   - Lenders are matched based on the highest lending amount.

2. Borrowing:
   - Call the `borrow` function by specifying the amount of tokens you want to borrow and the collateral amount.
   - Borrowed tokens will be transferred to your wallet.
   - You become an active borrower.
   - Borrowers are matched based on collateral amount and credit score.

3. Repaying Debt:
   - Call the `repay` function to repay a portion of your debt.
   - Repaid tokens will be transferred from your wallet to the smart contract.
   - Your debt decreases accordingly.

4. Setting Interest Rate (Owner Only):
   - The smart contract owner can set the static interest rate using the `setInterestRate` function.

5. Calculating Interest:
   - You can use the `getInterestAmount` function to calculate the interest amount for a specific borrower.

6. Lender-Borrower Matching:
   - Lenders and borrowers are automatically matched based on the hierarchy of highest lender, extensive collateral, and credit score.
   - The smart contract ensures fair matching and borrowing.

## Notes

- Make sure to have enough test Ethereum or test tokens in your wallet to interact with the smart contract.
- Use the Ethereum wallet or MetaMask to interact with the smart contract functions.



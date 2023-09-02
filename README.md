# Defilend
The Ethereum Borrowing and Lending Web App is a decentralized application (DApp) that allows users to borrow and lend cryptocurrency assets on the Ethereum network using the `cont.sol` smart contract. This README provides instructions on how to use the web app and its features.

## Features of tested app

1. Borrowers can request loans by specifying the amount they want to borrow and providing collateral.
2. Lenders can offer loans by specifying the amount they want to lend in front end.
3. Borrowers can repay their loans, including accrued interest.
4. The smart contract enforces static interest rates on loans.
5. Users can interact with the Ethereum network using the web app's user interface.

Features improvement cont2.sol (not tested)
## Features

1. Lenders can lend a specified amount of tokens and provide collateral.
2. Borrowers can borrow tokens by providing collateral.
3. Borrowers can repay their debts.
4. The smart contract enforces a static interest rate on borrowed amounts.
5. Lenders and borrowers have credit scores to track their history.
6. Lenders and borrowers are matched based on a hierarchy: highest lender, extensive collateral, and credit score.

## Prerequisites

-  MetaMask extension installed in your browser.
- Some tokens to interact with the smart contract on the goreli test network.

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



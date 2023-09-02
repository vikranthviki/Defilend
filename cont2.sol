// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LendingPlatform {
    struct Lender {
        address account;
        uint256 amountLent;
        uint256 collateral;
        uint256 creditScore;
        bool active;
    }
    
    struct Borrower {
        address account;
        uint256 borrowedAmount;
        uint256 collateral;
        uint256 creditScore;
        uint256 repaymentFrequency; // Number of times borrower repaid previous loans
        bool active;
    }
    
    mapping(address => Lender) public lenders;
    mapping(address => Borrower) public borrowers;
    
    uint256 public interestRate; // Static interest rate in percentage (e.g., 5%)
    
    constructor(uint256 _interestRate) {
        interestRate = _interestRate;
    }
    
    modifier onlyActiveLender() {
        require(lenders[msg.sender].active, "Only active lenders can perform this action");
        _;
    }
    
    modifier onlyActiveBorrower() {
        require(borrowers[msg.sender].active, "Only active borrowers can perform this action");
        _;
    }
    
    function lend(uint256 _amount, uint256 _collateral) external {
        require(_amount > 0 && _collateral > 0, "Amount and collateral must be greater than 0");
        Lender storage lender = lenders[msg.sender];
        require(!lender.active, "Lender is already active");
        
        lender.account = msg.sender;
        lender.amountLent = _amount;
        lender.collateral = _collateral;
        lender.active = true;
        
        // Update credit score for lenders
        lender.creditScore = 1;
    }
    
    function borrow(uint256 _amount, uint256 _collateral) external {
        require(_amount > 0 && _collateral > 0, "Amount and collateral must be greater than 0");
        Borrower storage borrower = borrowers[msg.sender];
        require(!borrower.active, "Borrower is already active");
        
        borrower.account = msg.sender;
        borrower.borrowedAmount = _amount;
        borrower.collateral = _collateral;
        borrower.active = true;
        
        // Update credit score for borrowers
        borrower.creditScore = 1;
    }
    
    function repayLoan(uint256 _amount) external onlyActiveBorrower {
        Borrower storage borrower = borrowers[msg.sender];
        require(_amount > 0 && _amount <= borrower.borrowedAmount, "Invalid repayment amount");
        
        // Calculate interest
        uint256 interest = (borrower.borrowedAmount * interestRate) / 100;
        
        // Repay principal and interest
        uint256 totalRepayment = _amount + interest;
        require(totalRepayment <= borrower.collateral, "Not enough collateral for repayment");
        
        // Transfer tokens and update borrower's credit score
        // TODO: Transfer tokens to lender and update credit score
        
        // Update borrower's repayment frequency
        borrower.repaymentFrequency++;
        
        // Reset borrowed amount if fully repaid
        if (_amount == borrower.borrowedAmount) {
            borrower.borrowedAmount = 0;
            borrower.active = false; // Close the loan
        }
    }
    
    function closeLoan() external onlyActiveBorrower {
        Borrower storage borrower = borrowers[msg.sender];
        
        // Transfer collateral back to borrower
        // TODO: Transfer collateral to borrower
        
        // Close the loan
        borrower.borrowedAmount = 0;
        borrower.active = false;
    }
    
    function withdrawCollateral() external onlyActiveLender {
        Lender storage lender = lenders[msg.sender];
        
        // Transfer collateral back to lender
        // TODO: Transfer collateral to lender
        
        // Close the lending position
        lender.amountLent = 0;
        lender.active = false;
    }
    
    // Other functions for querying user details, credit scores, etc.
}

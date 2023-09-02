// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LendingPlatform {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public loans;
    mapping(address => uint256) public collateral;

    uint256 public staticInterestRate = 5; // 5% interest rate

    event Borrow(address indexed borrower, uint256 amount);
    event Repay(address indexed borrower, uint256 amount);
    event Liquidate(address indexed borrower, uint256 amount);

    modifier onlyPositive(uint256 number) {
        require(number > 0, "Amount must be positive");
        _;
    }

    function depositCollateral() external payable {
        require(msg.value > 0, "Collateral amount must be greater than 0");
        balances[msg.sender] += msg.value;
        collateral[msg.sender] += msg.value;
    }

    function borrow(uint256 amount) external onlyPositive(amount) {
        require(collateral[msg.sender] >= amount, "Insufficient collateral");

        loans[msg.sender] += amount;
        balances[msg.sender] -= amount;
        collateral[msg.sender] -= amount;

        emit Borrow(msg.sender, amount);
    }

    function repay(uint256 amount) external onlyPositive(amount) {
        require(loans[msg.sender] >= amount, "Insufficient loan balance");

        loans[msg.sender] -= amount;
        balances[msg.sender] += amount;

        emit Repay(msg.sender, amount);
    }

    function liquidate(address borrower) external {
        require(borrower != address(0), "Invalid borrower address");
        require(collateral[borrower] < loans[borrower], "Collateral sufficient");

        uint256 amountToLiquidate = loans[borrower] - collateral[borrower];
        balances[msg.sender] += amountToLiquidate;
        balances[borrower] -= amountToLiquidate;

        emit Liquidate(borrower, amountToLiquidate);
    }

    function calculateInterest(address borrower) public view returns (uint256) {
        return (loans[borrower] * staticInterestRate) / 100;
    }
}
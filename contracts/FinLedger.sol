// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;



/**
 * @title FinLedger
 * @dev A simple blockchain-based financial ledger that allows users to record transactions securely and transparently.
 */

contract FinLedger {
    struct Transaction {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
    }

    Transaction[] private transactions;
    address public owner;

    event TransactionRecorded(address indexed sender, address indexed receiver, uint256 amount, uint256 timestamp);

    constructor() {
        owner = msg.sender;
    }

    function recordTransaction(address _receiver, uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        transactions.push(Transaction(msg.sender, _receiver, _amount, block.timestamp));
        emit TransactionRecorded(msg.sender, _receiver, _amount, block.timestamp);
    }

    function getAllTransactions() external view returns (Transaction[] memory) {
        return transactions;
    }

    function getTransactionCount() external view returns (uint256) {
        return transactions.length;
    }
}

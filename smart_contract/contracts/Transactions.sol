// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Transactions{
    uint256 transactionsCount;

    event Transfer(address from, address reciever, uint amount, string message, uint256 timestamp, string keyword);

    struct TrasnferStruct{
        address sender;
        address reciever;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TrasnferStruct[] transactions;

    function addToBlockChain(address payable reciever, uint amount, string memory message, string memory keyword) public{
        transactionsCount +=1;
        transactions.push(TrasnferStruct(msg.sender, reciever, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, reciever, amount, message, block.timestamp, keyword); //because were not actually doing the transfer
    }
        function getAllTransactions() public view returns (TrasnferStruct[] memory){
        return transactions;
    }
        function getTransactionCount() public view returns (uint256 ){
        return transactionsCount;
    }
}

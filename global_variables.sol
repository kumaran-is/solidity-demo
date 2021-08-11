// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract GlobalVariables {
    address public owner;
    uint public sentValue;
    uint private startGasValue;
    uint private endGasValue;
    
    // the current time as a timestamp (seconds from 01 Jan 1970)
uint public block_timestamp = block.timestamp; // `now` is deprecated and is an alias to block.timestamp)
 
// the current block number
uint public block_number = block.number;
 
// the block difficulty
uint public difficulty = block.difficulty;
 
// the block gas limit
uint public gaslimit = block.gaslimit;

    
    constructor() {
        // You want to register the account that is deploying the contract. That's the admin and will have more privileges
        owner = msg.sender;
    }

    
    function changeOwner() public {
        startGas();
        owner = msg.sender;
        endGas();
    }


    function sendEther() public payable {
        startGas();
        sentValue = msg.value;
        endGas();
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function howMuchGas() public view returns(uint) {
        uint start = gasleft();
        uint j = 1;
        for(uint i=1; i<20; i++) {
            j*=i;
        }
        uint end = gasleft();
        return start - end;
    }
    
    function startGas() public {
        startGasValue = gasleft();
    }
    
     function endGas() public {
        endGasValue = gasleft();
    }
    
    function howMuchForThisOpertion() public view returns(uint) {
       return  (startGasValue - endGasValue);
    }


}
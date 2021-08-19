//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract Lottery {
    // declaring the state variables
    address payable[] public players;
    address public manager;
    
    constructor() {
        // initializing the owner to the address that deploys the contract
        manager = msg.sender;
        // if needed this logic adding the manager to the lottery
       //  players.push(payable(manager));
    }
    
    receive() external payable {
        
        // the manager can not participate in the lottery
        require(msg.sender != manager);
        // each player sends exactly 0.1 ETH 
        require(msg.value == 0.1 ether);
        /*
        Events are the way to notify the transaction initiator about the actions performed by the called function. It stores its emitted parameters in a certain log history
        */
      //  emit Received(msg.sender, msg.value);
        //convert plain address to payable address before pushing to array of players
        // appending the player to the players array
        players.push(payable(msg.sender));
    }
    
    // returning the contract's balance in wei
    function getBalance()  public view returns(uint) {
        // only the manager is allowed to call it
        require(msg.sender == manager);
        return address(this).balance;
    }
    
    // helper function that returns a big random integer
    function random() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }
    
    // selecting the winner
    function pickWinner() public  {
         // only the manager can pick a winner if there are at least 3 players in the lottery
       require(msg.sender == manager);
       require(players.length >= 3);
       
       uint r = random();
       address payable winner;
               
        // computing a random index of the array
       uint index = r % players.length;
       
       winner = players[index]; // this is the winner
       
       uint managerFee = (getBalance() * 10 ) / 100; // manager fee is 10%
        uint winnerPrize = (getBalance() * 90 ) / 100;     // winner prize is 90%
        
        winner.transfer(winnerPrize);
        
       // transferring the 90% balance to the winner
       winner.transfer(winnerPrize);
      // winner.transfer(getBalance());
      
      // transferring 10% of contract's balance to the manager
        payable(manager).transfer(managerFee);
       // resetting the lottery for the next round
       players = new address payable[](0);
    }
    
   
}
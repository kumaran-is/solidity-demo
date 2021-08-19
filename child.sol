//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract Base {
    
    int public x;
    address public owner;
    
    constructor() {
        x = 5;
        owner = msg.sender;
    }
    
    function setX(int _x) public {
        x = _x;
    }
    
} 

contract Child is Base {
    int public y =3;
    
}
    
//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
abstract contract Base {
    
    int public x;
    int public a;
    address public owner;
    
    constructor() {
        x = 5;
        owner = msg.sender;
    }
    
    function setX(int _x) public {
        x = _x;
    }
    
    function setA(int _a) public virtual;
    
} 

contract Child is Base {
    int public y = 3;
    //cannot override state variable.
    // int public x = 10;
    
    function setA(int _a) public override{
        a = _a;
    }
    
    
}
    
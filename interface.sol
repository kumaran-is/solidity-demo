//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
interface Base {
    
    function setX(int _x) external;
    function setA(int _a) external;
    
} 

contract Child is Base {
    int public x = 3;
    int public a = 10;
    
    function setA(int _a) public override{
        a = _a;
    }
    
    function setX(int _x) public override{
        x = _x;
    }
}
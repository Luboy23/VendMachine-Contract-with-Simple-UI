// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract VendingMachine {
    address public owner;
    mapping(address => uint256) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function getVendingMachineBalance() public view returns(uint ) {
        return donutBalances[address(this)];
    }

    function restoke(uint amount) public {
        require(msg.sender == owner,"not a owner!");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable{
        require(msg.value >= amount * 2 ether, "don`t have enough money!");
        require(amount <= donutBalances[address(this)], "don`t have enough money!");
         donutBalances[address(this)] -=amount;
         donutBalances[msg.sender] += amount;
    }
}
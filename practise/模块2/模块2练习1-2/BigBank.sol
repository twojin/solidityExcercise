// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4;
import './Bank.sol';
contract BigBank is Bank {

    modifier vailAmount(uint _amount) {
        require(_amount > 0.001 ether, "amount must bigger than 0.01 ether");
        _;
    }

    modifier VaiOwner() {
        require(owner == msg.sender, "Only the owner can operate");
        _;
    }

    constructor() {
        owner = msg.sender;
    }


    function withdraw(uint _amount) override external  VaiOwner(){
        callETH(payable(msg.sender), _amount);
    }

     
    function deposit() external override payable vailAmount(msg.value){
        require(msg.value > 0, "Disposit must be > 0");
        ledger[msg.sender] += msg.value;
    }

    function changeOwner(address _address) external VaiOwner() {
        require(_address != address(0), "address must not be zero");
        owner = _address;
    }

}
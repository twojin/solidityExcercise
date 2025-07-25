// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4;
import './Bank.sol';
contract BigBank is Bank {

    constructor() {
        owner = msg.sender;
    }

    function withdraw(uint _amount) override external {
        require(owner == msg.sender, "Only is allowed to withdraw ");
        callETH(payable(msg.sender), _amount);
    }
}
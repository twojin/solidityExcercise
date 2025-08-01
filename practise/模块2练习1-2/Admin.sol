// SPDX-License-Identifier: MIT

import './IBank.sol';
pragma solidity ^0.8.4;
contract Admin {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function adminWithdraw(IBank bank, uint _amount) external  {
        bank.withdraw(_amount);
    }

    function getBalance() public  view returns(uint) {
        return address(this).balance;
    }

    receive() external payable { } 
}
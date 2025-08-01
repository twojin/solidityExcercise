// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import 'https://github.com/thirdweb-dev/contracts/blob/main/contracts/eip/interface/IERC20.sol';
contract TokenBank {

    address private _tokenAddress;

    mapping (address => uint256) private depositNote;

    constructor(address _address) {
        _tokenAddress = _address;
    }

    function deposit(uint amount) external {
        require(amount > 0, "amount must bigger than 0");
        (bool success) = IERC20(_tokenAddress).transferFrom(msg.sender, address(this), amount);
        require(success, "deposit fail");
        depositNote[msg.sender] += amount;
    }

    function withdraw(uint amount) external  {
        require(depositNote[msg.sender] >= amount, "Insufficient balance");
        IERC20(_tokenAddress).transfer(msg.sender, amount);
    }

}

// TokenBank 有两个方法：

// deposit() : 需要记录每个地址的存入数量；
// withdraw（）: 用户可以提取自己的之前存入的 token。
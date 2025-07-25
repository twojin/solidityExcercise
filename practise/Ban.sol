// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
// 编写一个 Bank 合约，实现功能：

// 可以通过 Metamask 等钱包直接给 Bank 合约地址存款
// 在 Bank 合约记录每个地址的存款金额
// 编写 withdraw() 方法，仅管理员可以通过该方法提取资金。
// 请提交完成项目代码或 github 仓库地址。
import './IBank.sol';
contract Bank is IBank{
    mapping(address => uint) ledger;
    address owner;
    error CallFail();
    constructor() {
        owner = msg.sender;
    }

    function withdraw(uint _amount) override external {
        require(owner == msg.sender, "Only is allowed to withdraw ");
        callETH(payable(msg.sender), _amount);
    }

    function callETH(address payable _to, uint _amount) internal {
        (bool success,) = _to.call{value: _amount}("");
        if ( !success ) {
            revert CallFail();
        }
    }

    function deposit() external payable{
        require(msg.value > 0, "Disposit must be > 0");
        ledger[msg.sender] += msg.value;
    }
}

// 在 该挑战 的 Bank 合约基础之上，编写 IBank 接口及BigBank 合约，使其满足 Bank 实现 IBank， BigBank 继承自 Bank ， 同时 BigBank 有附加要求：

// 要求存款金额 >0.001 ether（用modifier权限控制）
// BigBank 合约支持转移管理员
// 编写一个 Admin 合约， Admin 合约有自己的 Owner ，同时有一个取款函数 adminWithdraw(IBank bank) , adminWithdraw 中会调用 IBank 接口的 withdraw 方法从而把 bank 合约内的资金转移到 Admin 合约地址。

// BigBank 和 Admin 合约 部署后，把 BigBank 的管理员转移给 Admin 合约地址，模拟几个用户的存款，然后

// Admin 合约的Owner地址调用 adminWithdraw(IBank bank) 把 BigBank 的资金转移到 Admin 地址。

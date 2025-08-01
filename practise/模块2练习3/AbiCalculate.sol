// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract AbiCalculate {

    function getTransferCalldataSize(address recipient, uint256 amount) external pure returns (uint256) {
        // 使用 encodeWithSignature 编码函数调用数据
        bytes memory data = abi.encodeWithSignature("transfer(address,uint256)", recipient, amount);
        return data.length;
    }

    // 为了测试，也可以返回编码后的数据本身
    function getTransferCalldata(address recipient, uint256 amount) external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)", recipient, amount);
    }
}



// 计算以下函数签名的 ABI 编码后的字节大小：
// function transfer(address recipient, uint256 amount)
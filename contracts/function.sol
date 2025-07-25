// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract functiontest{

    // function a() external payable returns(uint256 balance) {
    //     balance =  address(this).balance;
    // }

    function b() private pure returns(int num) {
        num = 2;
    }
}
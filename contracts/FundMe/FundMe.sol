// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {
    uint256 public minimumUsd = 50;

    function fund() public payable {
        // 1.How to send ETH to this contract ?
        require(msg.value >= minimumUsd, "Didn't send enough ETH"); 
        // 1eth = 1e18 = 1 * 10 ** 18 == 1000000000000000000
        // could be msg.value >= 1e18

    }
}

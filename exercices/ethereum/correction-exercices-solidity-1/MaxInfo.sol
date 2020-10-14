// SPDX-License-Identifier: MIT                 r
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract MaxInfo {
  struct Info {
    address sender;
    uint256 sender_balance;
    uint256 block_number;
    uint256 block_timestamp;
  }

  function getInfo() public view returns (Info memory) {
    return Info(msg.sender, msg.sender.balance, block.number, block.timestamp);
  }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract WhiteListed {
  address public calculatorAddress;
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyAddress() {
    require(
      msg.sender == calculatorAddress,
      'Only white list address can perform this action'
    );
    _;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, 'Only admins can perform this action');
    _;
  }

  function setCalculatorAddress(address _calculatorAddress) public onlyOwner {
    calculatorAddress = _calculatorAddress;
  }
}

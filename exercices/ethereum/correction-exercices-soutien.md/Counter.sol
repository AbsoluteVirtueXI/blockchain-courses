// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Counter {
  // storage
  uint256 private _count;
  uint256 private _step;

  constructor() public {
    _count = 0;
    _step = 1;
  }

  function inc() public {
    _count += _step;
  }

  function getCount() public view returns (uint256) {
    return _count;
  }

  function getStep() public view returns (uint256) {
    return _step;
  }

  function setStep(uint256 step) public {
    _step = step;
  }

  function reset() public {
    _count = 0;
  }
}

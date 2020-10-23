// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract TransactionCounter {
  uint256 private _counter;
  address private _owner;
  mapping(address => bool) private _addresses;

  constructor() public {
    _counter = 0;
    _owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == _owner, 'Only admin can perform this action');
    _;
  }

  modifier onlyAddress() {
    require(_addresses[msg.sender], 'Not allowed');
    _;
  }

  function addTicker(address _address) public onlyOwner {
    _addresses[_address] = true;
  }

  function delTicker(address _address) public onlyOwner {
    _addresses[_address] = false;
  }

  function isTicker(address _address) public view returns (bool) {
    return _addresses[_address];
  }

  function tick() public onlyAddress returns (uint256) {
    _counter += 1;
    return _counter;
  }

  function getCount() public view returns (uint256) {
    return _counter;
  }
}

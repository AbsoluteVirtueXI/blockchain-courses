// SPDX-License-Identifier: MIT                 r
pragma solidity ^0.6.0;
import './Adder.sol';
import './Suber.sol';

contract Calculator {
  Adder public adderContract;
  Suber public suberContract;

  constructor() public {
    adderContract = Adder(0x82de6Ef0a8E7164B0CED019e7D61D51C69dE7590);
    suberContract = Suber(0x10D4b95D72923411073b6095cd29B02696eD88A0);
  }

  function add(uint256 nb1, uint256 nb2) public view returns (uint256) {
    return adderContract.add(nb1, nb2);
  }

  function sub(uint256 nb1, uint256 nb2) public view returns (uint256) {
    return suberContract.sub(nb1, nb2);
  }
}

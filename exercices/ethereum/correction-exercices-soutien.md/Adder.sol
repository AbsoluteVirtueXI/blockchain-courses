// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './WhiteListed.sol';

// Adder deployed at 0xf062bf18d3579f114f694343b674792D16fA74dA
contract Adder is WhiteListed {
  function add(uint256 nb1, uint256 nb2)
    public
    view
    onlyAddress
    returns (uint256)
  {
    return nb1 + nb2;
  }
}

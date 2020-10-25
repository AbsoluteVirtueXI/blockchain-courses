// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './WhiteListed.sol';

// Multiplier deployed at 0xB6508D4BD545dae62446D31AAfD0ACd5b65cC5AC
contract Multiplier is WhiteListed {
  function mul(uint256 nb1, uint256 nb2)
    public
    view
    onlyAddress
    returns (uint256)
  {
    return nb1 * nb2;
  }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './WhiteListed.sol';

//Suber deployed at 0xB0667Bf5e0FF372B30b602CeaF66BD7086bBF6e4
contract Suber is WhiteListed {
  function sub(uint256 nb1, uint256 nb2)
    public
    view
    onlyAddress
    returns (uint256)
  {
    require(nb1 > nb2, 'Suber: no negative value here.');
    return nb1 - nb2;
  }
}

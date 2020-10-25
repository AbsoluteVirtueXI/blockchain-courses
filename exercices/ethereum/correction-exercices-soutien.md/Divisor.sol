// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './WhiteListed.sol';

// Divisor deployed at 0x67a72100F70EC71D01A7D9Ec5Adc14B68f36Bc57
contract Divisor is WhiteListed {
  function div(uint256 nb1, uint256 nb2)
    public
    view
    onlyAddress
    returns (uint256)
  {
    require(nb2 > 0, 'Divisor: can not divide by 0');
    return nb1 / nb2;
  }
}

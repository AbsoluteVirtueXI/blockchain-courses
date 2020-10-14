// SPDX-License-Identifier: MIT                 r
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

/// @title A blockchain calculator API
/// @author Sofiane Akermoun <absolutevirtuexi@gmail.com>
/// @notice This contract was written for the dwd studens from Alyra School
/// @dev All function calls are currently implemented without side effects
contract Calc {
  address private owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(owner == msg.sender, 'Only owner can use this function');
    _;
  }

  /// @notice An addition function
  /// @param a First number of the add operation
  /// @param b Second number of the add operation
  /// @return the result of the addition a + b
  function add(uint256 a, uint256 b) public view onlyOwner returns (uint256) {
    return a + b;
  }

  /// @notice A substraction function
  /// @param a First number of the sub operation
  /// @param b Second number of the sub operation
  /// @return the result of the substraction a - b
  function sub(uint256 a, uint256 b) public view onlyOwner returns (uint256) {
    return a - b;
  }

  /// @notice A multiplication function
  /// @param a First number of the sub operation
  /// @param b Second number of the sub operation
  /// @return the result of the multiplication a * b
  function mul(uint256 a, uint256 b) public view onlyOwner returns (uint256) {
    return a * b;
  }

  /// @notice A division function
  /// @dev need to check for 0 division
  /// @param a The numerator
  /// @param b The denominator
  /// @return the result of the division a / b
  function div(uint256 a, uint256 b) public view onlyOwner returns (uint256) {
    return a / b;
  }
}

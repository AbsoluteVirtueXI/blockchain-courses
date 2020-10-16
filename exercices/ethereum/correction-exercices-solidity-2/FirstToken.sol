// SPDX-License-Identifier: MIT                 r
pragma solidity ^0.6.0;

contract FirstToken {
  mapping(address => bool) public investors;
  mapping(address => uint256) public balances;
  address payable wallet;

  event Purchase(address indexed _buyer, uint256 _amount);

  modifier atLeast1Ether() {
    require(msg.value >= 1 ether, 'Minimum price is 1 ether');
    _;
  }

  modifier onlyOwner() {
    require(msg.sender == wallet, 'Only owner can perform this action');
    _;
  }

  constructor(address payable _wallet) public {
    wallet = _wallet;
  }

  receive() external payable {
    buyToken();
  }

  fallback() external payable {
    wallet.transfer(msg.value);
  }

  function setInvestor(address _investor) public onlyOwner returns (bool) {
    investors[_investor] = true;
    return true;
  }

  function unSetInvestor(address _investor) public onlyOwner returns (bool) {
    investors[_investor] = false;
    return true;
  }

  function buyToken() public payable atLeast1Ether {
    // buy a token
    uint256 multiplier = investors[msg.sender] ? 10 : 1;
    balances[msg.sender] += (msg.value / 1 ether) * multiplier;
    // send ether to the wallet
    wallet.transfer(msg.value);
    emit Purchase(msg.sender, msg.value);
  }
}

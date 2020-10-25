// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './Adder.sol';
import './Suber.sol';
import './Multiplier.sol';
import './Divisor.sol';
import './CalcToken.sol';

// CalkToken deployed at  0x3e34cf7C6347dA5CBa804188075F8D5CC6B6A73f
// Calculator deployed at 0xE8D4Ac1A24Dad6789AcCFd958ec56626Eb21b89F
contract Calculator {
  FirstErc20 public token;
  uint256 public opPrice;
  address payable wallet;
  Adder private adderContract;
  Suber private suberContract;
  Multiplier private multiplierContract;
  Divisor private divisorContract;

  constructor(address _calcToken, uint256 _opPrice) public {
    token = FirstErc20(_calcToken);
    opPrice = _opPrice;
    wallet = msg.sender;
    adderContract = Adder(0xf062bf18d3579f114f694343b674792D16fA74dA);
    suberContract = Suber(0xB0667Bf5e0FF372B30b602CeaF66BD7086bBF6e4);
    multiplierContract = Multiplier(0xB6508D4BD545dae62446D31AAfD0ACd5b65cC5AC);
    divisorContract = Divisor(0x67a72100F70EC71D01A7D9Ec5Adc14B68f36Bc57);
  }

  event Result(
    address indexed addr,
    string operation,
    uint256 op1,
    uint256 op2,
    uint256 res
  );

  function calkBalance() public view returns (uint256) {
    return token.balanceOf(address(this));
  }

  function withdraw() public {
    require(msg.sender == wallet, 'Only admins can perform this action.');
    token.transfer(wallet, calkBalance());
  }

  function add(uint256 nb1, uint256 nb2) public returns (uint256) {
    token.transferFrom(msg.sender, address(this), opPrice);
    uint256 res = adderContract.add(nb1, nb2);
    emit Result(msg.sender, 'add', nb1, nb2, res);
    return res;
  }

  function sub(uint256 nb1, uint256 nb2) public returns (uint256) {
    token.transferFrom(msg.sender, address(this), opPrice);
    uint256 res = suberContract.sub(nb1, nb2);
    emit Result(msg.sender, 'sub', nb1, nb2, res);
    return res;
  }

  function mul(uint256 nb1, uint256 nb2) public returns (uint256) {
    token.transferFrom(msg.sender, address(this), opPrice);
    uint256 res = multiplierContract.mul(nb1, nb2);
    emit Result(msg.sender, 'mul', nb1, nb2, res);
    return res;
  }

  function div(uint256 nb1, uint256 nb2) public returns (uint256) {
    token.transferFrom(msg.sender, address(this), opPrice);
    uint256 res = divisorContract.div(nb1, nb2);
    emit Result(msg.sender, 'div', nb1, nb2, res);
    return res;
  }
}

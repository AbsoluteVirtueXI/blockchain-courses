// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './CalcToken.sol';

// CalcToken deployed at 0xc311D39FbD47F122ba89Cb4EBdB9b06bc3deEf77
// price = 100000000000000000 wei d'ether (0.1 ether)
// CALKIco deployed at  0x4E5b37D822AF3527159d493744954Fa77eBED911
contract CALKIco {
  // Declare a FirstErc20 contract
  FirstErc20 public token;

  // The price of 1 unit of our token in wei;
  uint256 public _price;

  // Address of token seller
  address payable private _seller;

  uint256 private _ratio;

  constructor(
    uint256 price, // price pour 1 CALK
    address payable seller,
    address erc20Address
  ) public {
    _price = price;
    _seller = seller;
    token = FirstErc20(erc20Address);
    _ratio = (10**uint256(token.decimals())) / _price; // 1 token / prix d'un token = ratio
  }

  receive() external payable {
    buy(msg.value * _ratio);
  }

  // nbTokens en wei de CALK
  function buy(uint256 nbTokens) public payable returns (bool) {
    // check is ether > 0
    require(msg.value > 0, 'ICO: price minimum 1 wei');
    // check is nbTokens superieur au mini qui 10 wei token
    require(nbTokens >= 10, 'ICO: minimum 10 wei tokens');
    // check si montant est OK
    require(
      (nbTokens * _price) / (10**uint256(token.decimals())) <= msg.value,
      'ICO: Not enough Ether for purchase'
    );
    uint256 _realPrice = (nbTokens * _price) / (10**uint256(token.decimals()));
    uint256 _remaining = msg.value - _realPrice;
    token.transferFrom(_seller, msg.sender, nbTokens);
    _seller.transfer(_realPrice);
    if (_remaining > 0) {
      msg.sender.transfer(_remaining);
    }
    return true;
  }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";
import "./Ownable.sol";

contract KingOfTheHill is Ownable {
    using Address for address payable;
    
    mapping(address => uint256) private _rewards;
    address private _potOwner;
    uint256 private _startBlock;
    uint256 private _pot;
    uint256 private _gain;
    uint256 private immutable _nbBlocks;
    uint256 private immutable _rewardPercentage;
    uint256 private immutable _gainPercentage;
    uint256 private immutable _seedPercentage;

    
    // Events ???
    

    constructor(address owner_, uint256 nbBlocks_, uint256 rewardPercentage_, uint256 gainPercentage_) Ownable(owner_) payable {
        require(msg.value > 0, "KingOfTheHill: pot need a seed");
        require(nbBlocks_ > 0, "KingOfTheHill: nb blocks to win cannot be zero");
        require(rewardPercentage_ + gainPercentage_ < 100, "KingOfTheHill: invalid percentages");
        _pot = msg.value;
        _nbBlocks = nbBlocks_;
        _rewardPercentage = rewardPercentage_;
        _gainPercentage = gainPercentage_;
        _seedPercentage = rewardPercentage_ > gainPercentage_ ? rewardPercentage_ - gainPercentage_ : gainPercentage_ - rewardPercentage_;
    }
    
    function buyPot() external payable {
        if(!isRoundRunning() && _potOwner != address(0)) {
            uint256 reward = _pot * _rewardPercentage / 100;
            uint256 gain_ = _pot * _gainPercentage / 100;
            _pot -= reward + gain_;
            _rewards[_potOwner] += reward;
            _gain += gain_;
            _potOwner = address(0);
        }
        require(msg.sender != _potOwner, "KingOfTheHill: sender already owns pot");
        require(msg.value >= _pot * 2, "KingOfTheHill: not enough ether for buying pot");
        _potOwner = msg.sender;
        _startBlock = block.number;
        uint256 change = msg.value - _pot * 2;
        _pot += _pot * 2;
        if(change > 0) {
            payable(msg.sender).sendValue(change);
        }
    }
    
    function withdrawReward() public {
        require(_rewards[msg.sender] > 0, "KingOfTheHill: can not withdraw 0 reward");
        uint256 amount = _rewards[msg.sender];
        _rewards[msg.sender] = 0;
        payable(msg.sender).sendValue(amount);
    }
    
    function withdrawGain() public onlyOwner {
        require(_gain > 0, "KingOfTheHill: can not withdraw 0 gain");
        uint256 amount = _gain;
        _gain = 0;
        payable(msg.sender).sendValue(amount);
    }
    
    function isRoundRunning() public view returns (bool) {
        return  _startBlock + _nbBlocks > block.number && _potOwner != address(0) ? true : false;
    }
    
    function winningBlock() public view returns (uint256) {
        return isRoundRunning() ? _startBlock + _nbBlocks : 0;
    }
    
    // TODO check off by one error
    function remainingBlock() public view returns (uint256) {
        return isRoundRunning() ? _startBlock + _nbBlocks - block.number: 0;
    }  
    
    function priceOfPot() public view returns (uint256) {
        if(isRoundRunning() || _potOwner == address(0)) {
            return _pot * 2;
        } else {
            return _pot * _seedPercentage * 2 / 100;
        }
    }
    
    function rewardOf(address account) public view returns (uint256) {
        return _rewards[account];
    }
    
    function potOwner() public view returns (address) {
        return _potOwner;
    }
    
    function pot() public view returns (uint256) {
        return _pot;
    }
    
    function gain() public view returns (uint256) {
        return _gain;
    }
    
    function nbBlocks() public view returns (uint256) {
        return _nbBlocks;
    }
    
    function rewardPercentage() public view returns (uint256) {
        return _rewardPercentage;
    }
    
    function gainPercentage() public view returns (uint256) {
        return _gainPercentage;
    }
    
    function seedPercentage() public view returns (uint256) {
        return _seedPercentage;
    }
}
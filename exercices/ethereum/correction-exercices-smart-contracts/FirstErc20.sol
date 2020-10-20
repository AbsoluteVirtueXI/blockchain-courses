// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract FirstErc20 {
  // Mapping from account addresses to current balance.
  mapping(address => uint256) private _balances;
  mapping(address => bool) private _admins;

  // Mapping from account addresses to a mapping of spender addresses to an amount of allowance.
  mapping(address => mapping(address => uint256)) private _allowances;

  // Name of the token
  string private _name;

  // Symbol of the token
  string private _symbol;

  // Number of decimals the token uses
  // for example 8, means to divide the token amount by 100000000 to get its user representation.
  uint8 private _decimals;

  // Total of the token supply
  uint256 private _totalSupply;

  // Maximum amount of the token supply
  uint256 private _cap;

  // Address of the owner, used for administrative and sensitive function.
  address payable _ownerAddress;

  constructor(
    string memory name,
    string memory symbol,
    uint8 decimals,
    uint256 amount2Owner,
    uint256 cap
  ) public {
    require(cap >= amount2Owner, 'ERC20: amount exceeds cap');
    _name = name;
    _symbol = symbol;
    _decimals = decimals;
    _cap = cap;
    _totalSupply = amount2Owner;
    _balances[msg.sender] = amount2Owner;
    _ownerAddress = msg.sender;
    _admins[msg.sender] = true;
  }

  // A modifier for checking if the msg.sender is the owner.
  modifier onlyAdmin() {
    require(_admins[msg.sender], 'ERC20: Only admins can perform this action');
    _;
  }

  // Returns the name of the token
  function name() public view returns (string memory) {
    return _name;
  }

  // Returns the symbol of the token
  function symbol() public view returns (string memory) {
    return _symbol;
  }

  // Return the nb of decimals the token uses
  function decimals() public view returns (uint8) {
    return _decimals;
  }

  // Returns the amount of tokens in existence
  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  // Returns the max amount of tokens in existence
  function cap() public view returns (uint256) {
    return _cap;
  }

  // Returns a `true` if `_account` is admin else `false`
  function isAdmin(address _account) public view returns (bool) {
    return _admins[_account];
  }

  // Returns the amount of tokens owned by `_account`.
  function balanceOf(address _account) public view returns (uint256) {
    return _balances[_account];
  }

  // Moves `_amount` tokens from the caller's account to `_recipient`.
  // Returns a boolean value indicating whether the operation succeeded.
  function transfer(address _recipient, uint256 _amount) public returns (bool) {
    require(
      _balances[msg.sender] >= _amount,
      'ERC20: transfer amount exceeds balance'
    );
    _balances[msg.sender] -= _amount;
    _balances[_recipient] += _amount;
    emit Transfer(msg.sender, _recipient, _amount);
    return true;
  }

  // Sets `_amount` as the allowance of `_spender` over the caller's tokens.
  // Returns a boolean value indicating whether the operation succeeded.
  function approve(address _spender, uint256 _amount) public returns (bool) {
    _allowances[msg.sender][_spender] = _amount;
    emit Approval(msg.sender, _spender, _amount);
    return true;
  }

  // Returns the remaining number of tokens that `_spender` will be allowed
  // to spend on behalf of `_owner` through `transferFrom`. This is zero by default.
  // This value changes when `approve` or `transferFrom` are called.
  function allowance(address _owner, address _spender)
    public
    view
    returns (uint256)
  {
    return _allowances[_owner][_spender];
  }

  // Moves `_amount` tokens from `_sender` to `_recipient` using the
  // allowance mechanism. `_amount` is then deducted from the caller's allowance.
  // Returns a boolean value indicating whether the operation succeeded.
  // Emits a `Transfer` event.
  function transferFrom(
    address _sender,
    address _recipient,
    uint256 _amount
  ) public returns (bool) {
    require(
      _balances[_sender] >= _amount,
      'ERC20: transfer amount exceeds balance'
    );
    require(
      _allowances[_sender][msg.sender] >= _amount,
      'ERC20: transfer amount exceeds allowance'
    );
    _balances[_sender] -= _amount;
    _balances[_recipient] += _amount;
    _allowances[_sender][msg.sender] -= _amount;
    emit Transfer(_sender, _recipient, _amount);
    return true;
  }

  // Creates `_amount` tokens and assigns them to `_account`, increasing
  // the total supply.
  // Emits a `Transfer` event with `_from` set to the zero address.
  function mint(address _account, uint256 _amount)
    public
    onlyAdmin
    returns (bool)
  {
    require(_totalSupply + _amount <= _cap, 'ERC20: cap exceeded');
    _totalSupply += _amount;
    _balances[_account] += _amount;
    emit Transfer(address(0), _account, _amount);
    return true;
  }

  // Burns `_amount` tokens from `_account` balance.
  function burn(address _account, uint256 _amount)
    public
    onlyAdmin
    returns (bool)
  {
    uint256 _burntAmount = _balances[_account] >= _amount
      ? _amount
      : _balances[_account];
    _totalSupply -= _burntAmount;
    _balances[_account] -= _burntAmount;
    emit Transfer(_account, address(0), _amount);
    return true;
  }

  // Adds `_account` administrator
  function addAdmin(address _account) public onlyAdmin {
    _admins[_account] = true;
  }

  // Revokes administrator rights for `acount`
  function delAdmin(address _account) public onlyAdmin {
    _admins[_account] = false;
  }

  // Emitted when `_value` tokens are moved from one account (`_from`) to another (`_to`)
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  // Emitted when the allowance of a `_spender` for an `_owner` is set by
  // a call to `approve`. `_value` is the new allowance.
  event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );
}

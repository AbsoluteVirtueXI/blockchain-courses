# **Smart contracts programming**

## **First Token contract**

_FirstToken.sol_

```solidity
// SPDX-License-Identifier: MIT                 r
pragma solidity >=0.6.0;

// Contrat FristToken à améliorer dans les exercices
contract FirstToken {
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    receive() external payable {
        buyToken();
    }

    fallback() external payable {
        wallet.transfer(msg.value);
    }

    function buyToken() public payable{
        // buy a token
        balances[msg.sender] += 1;
        // send ether to the wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
```

## **EIP: Ethereum Improvement Proposals**

EIPs website: https://eips.ethereum.org/

Ethereum est un écosystème récent, beaucoup reste à faire, et de nouvelles idées et innovations fleurissent constamment. Ce qui est un standard aujourd'hui sur Ethereum, le reste très rarement pour longtemps.  
Ethereum a mit en place un protocole pour gérer les propositions concernant de nouvelles fonctionnalités ou d'amélioration pour Ethereum: **EIP: Ethereum Improvement Proposals**.

> EIP stands for Ethereum Improvement Proposal. An EIP is a design document providing information to the Ethereum community, or describing a new feature for Ethereum or its processes or environment. The EIP should provide a concise technical specification of the feature and a rationale for the feature. The EIP author is responsible for building consensus within the community and documenting dissenting opinions.

Ces propositions sont conventionnellement nommées `EIP-XXXX`, `XXXX` un chiffre arbitrairement donné par le créateur de cet EIP, mais il est usuel que ce chiffre suive celui de la précédente EIP proposée.

Par exemple me modèle de token `ERC-20`a été introduit dans l'`EIP-20`: https://eips.ethereum.org/EIPS/eip-20  
Le modèle de token `ERC-721` a été introduit dans l'`EIP-721`: https://eips.ethereum.org/EIPS/eip-721

Lors de la rédaction d'un `EIP` le créateur propose sa vision à la communauté, d'abord en tant que brouillon, créant ainsi un débat qui entraîne souvent une modification ou une amélioration de sa vision originale.
Actuellement ce débat et les discussions relatives à la proposition d'un `EIP` s'effectue dans les `issues` de github: https://github.com/ethereum/EIPs/issues

## **ERC-20**

`EIP-20`: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md  
L'`ERC-20` est le standard de token le plus utilisé sur Ethereum.
Dans l'`EIP-20` les auteurs décrivent le standard qu'ils ont proposés, (et qui a été validé par la communauté).  
La motivation derrière ce standard:

> A standard interface allows any tokens on Ethereum to be re-used by other applications: from wallets to decentralized exchanges.

Une interface que les créateurs devront implémenter afin d'adhérer à un standard, et ainsi pouvoir être utilisé par ceux qui comprennent ce standard, comme les wallets, les Dapp, les autres smart contracts ou des exchanges.

Implémenter l'interface d'un `ERC-20` signifie qu'il faut que le smart contract de notre token contienne au minimum les fonctions définies dans cette interface.

L'interface à implémenter est décrite dans `EIP-20` mais nous pouvons aussi la retrouver sur le repository d'Openzepplin: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol

```solidity
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
```

Dans ce même repository nous pouvons trouver une implémentation de cette interface par Openzepplin:  
**ERC-20 token by Openzepplin**:  
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol

## **Deep analysis of the ERC-20 interface and implementation**

`EIP-20` décrit toutes les fonctions que notre smart contract doit implémenter pour être considérer comme un `ERC-20`. `EIP-20` définit une `interface` à laquelle doit adhérer notre smart contracts.  
la définition d'une `interface` décrit uniquement les `function` et `event` à implémenter, la manière dont ils sont implémentés n'est pas décrite.  
Dans une interface on ne retrouve que les signatures des `function` et des `event`:

- le nom de la `function`/`event`.
- les paramètres. C'est surtout le nombre et le type de ces paramètres qui est important, le nom de chacun des paramètres peut être différent lors de l'implémentation.
- la visibilité (`public`, `private`, `external`, `internal`).
- `view` or `pure` modifiers.
- le modifier `payable` si cette fonction doit recevoir de l'`ether`.
- le type de la valeur retournée par la fonction.

Il peut aussi exister d'autres directives à respecter qui seront indiquer dans l'`EIP` qui décrit l'interface à implémenter.  
Par exemple dans `EIP-20` on nous indique que les fonctions: `name`, `symbol` et `decimals` sont optionnelles, que la fonction `transfer` devra `throw`/`revert` si un sender essaye de transférer plus de fonds que ce qu'il possède et que les `function` `transfer` et `transferFrom` devront émettre l'`event` `Transfer`.

```solidity
// Name of the token
string private _name;

// Returns the name of the token
function name() public view returns(string memory) {
    return _name;
}
```

```solidity
// Symbol of the token
string private _symbol;

// Returns the symbol of the token
function symbol() public view returns (string memory) {
    return _symbol;
}
```

```solidity
// Number of decimals the token uses
// for example 8, means to divide the token amount by 100000000 to get its user representation.
uint8 private _decimals;

// Return the nb of decimals the token uses
function decimals() public view returns (uint8) {
    return _decimals;
}
```

```solidity
// Total of the token supply
uint256 private _totalSupply;

// Returns the amount of tokens in existence
function totalSupply() public view returns (uint256) {
    return _totalSupply;
}
```

```solidity
// Mapping from account addresses to current balance.
mapping (address => uint256) private _balances;

// Returns the amount of tokens owned by `_account`.
function balanceOf(address _account) public view returns (uint256) {
    return _balances[_account];
}
```

```solidity
// Emitted when `_value` tokens are moved from one account (`_from`) to another (`_to`)
event Transfer(address indexed _from, address indexed _to, uint256 _value);

// Moves `_amount` tokens from the caller's account to `_recipient`.
// Returns a boolean value indicating whether the operation succeeded.
function transfer(address _recipient, uint256 _amount) public returns (bool) {
    require(_balances[msg.sender] >= _amount, 'ERC20: transfer amount exceeds balance');
    _balances[msg.sender] -= _amount;
    _balances[_recipient] += _amount;
    emit Transfer(msg.sender, _recipient, _amount);
    return true;
}
```

```solidity
// Emitted when the allowance of a `_spender` for an `_owner` is set by
// a call to `approve`. `_value` is the new allowance.
event Approval(address indexed _owner, address indexed _spender, uint256 _value);

// Mapping from account addresses to a mapping of spender addresses to an amount of allowance.
mapping (address => mapping (address => uint256)) private _allowances;

// Sets `_amount` as the allowance of `_spender` over the caller's tokens.
// Returns a boolean value indicating whether the operation succeeded.
function approve(address _spender, uint256 _amount) public returns (bool) {
    _allowances[msg.sender][_spender] = _amount;
    emit Approval(msg.sender, _spender, _amount);
    return true;
}
```

```solidity
// Returns the remaining number of tokens that `_spender` will be allowed
// to spend on behalf of `_owner` through `transferFrom`. This is zero by default.
// This value changes when `approve` or `transferFrom` are called.
function allowance(address _owner, address _spender) public view returns (uint256) {
    return _allowances[_owner][_spender];
}
```

```solidity
// Moves `_amount` tokens from `_sender` to `_recipient` using the
// allowance mechanism. `_amount` is then deducted from the caller's allowance.
// Returns a boolean value indicating whether the operation succeeded.
// Emits a `Transfer` event.
function transferFrom(address _sender, address _recipient, uint256 _amount) public returns (bool) {
    require(
        _balances[_sender] >= _amount,
        "ERC20: transfer amount exceeds balance"
    );
    require(
        _allowances[_sender][msg.sender] >= _amount,
        "ERC20: transfer amount exceeds allowance"
    );
    _balances[_sender] -= _amount;
    _balances[_recipient] += _amount;
    _allowances[_sender][msg.sender] -= _amount;
    emit Transfer(_sender, _recipient, _amount);
    return true;
}
```

A basic implementation of ERC-20 interface:

_FirstErc20.sol_:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract FirstErc20 {
    // Mapping from account addresses to current balance.
    mapping (address => uint256) private _balances;

    // Mapping from account addresses to a mapping of spender addresses to an amount of allowance.
    mapping (address => mapping (address => uint256)) private _allowances;

    // Name of the token
    string private _name;

    // Symbol of the token
    string private _symbol;

    // Number of decimals the token uses
    // for example 8, means to divide the token amount by 100000000 to get its user representation.
    uint8 private _decimals;

    // Total of the token supply
    uint256 private _totalSupply;

    constructor(string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    // Returns the name of the token
    function name() public view returns(string memory) {
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

    // Returns the amount of tokens owned by `_account`.
    function balanceOf(address _account) public view returns (uint256) {
        return _balances[_account];
    }

    // Moves `_amount` tokens from the caller's account to `_recipient`.
    // Returns a boolean value indicating whether the operation succeeded.
    function transfer(address _recipient, uint256 _amount) public returns (bool) {
        require(_balances[msg.sender] >= _amount, 'ERC20: transfer amount exceeds balance');
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
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowances[_owner][_spender];
    }

    // Moves `_amount` tokens from `_sender` to `_recipient` using the
    // allowance mechanism. `_amount` is then deducted from the caller's allowance.
    // Returns a boolean value indicating whether the operation succeeded.
    // Emits a `Transfer` event.
    function transferFrom(address _sender, address _recipient, uint256 _amount) public returns (bool) {
        require(
            _balances[_sender] >= _amount,
            "ERC20: transfer amount exceeds balance"
        );
        require(
            _allowances[_sender][msg.sender] >= _amount,
            "ERC20: transfer amount exceeds allowance"
        );
        _balances[_sender] -= _amount;
        _balances[_recipient] += _amount;
        _allowances[_sender][msg.sender] -= _amount;
        emit Transfer(_sender, _recipient, _amount);
        return true;
    }

    // Emitted when `_value` tokens are moved from one account (`_from`) to another (`_to`)
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Emitted when the allowance of a `_spender` for an `_owner` is set by
    // a call to `approve`. `_value` is the new allowance.
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
```

## **Customize our first ERC-20 token**

On peut ajouter un maximum de tokens que le smart contracts pourra créer, ainsi qu'une fonction pour créer de nouveaux tokens.

```solidity
// Maximum amount of the token supply
uint256 private _cap;

// Address of the owner, used for administrative and sensitive function.
address payable _ownerAddress;

constructor(string memory name,
            string memory symbol,
            uint8 decimals,
            uint256 amount2Owner,
            uint256 cap) public
{
    require(cap >= amount2Owner, 'ERC20: amount exceeds cap');
    _name = name;
    _symbol = symbol;
    _decimals = decimals;
    _cap = cap;
    _totalSupply = amount2Owner;
    _balances[msg.sender] = _totalSupply;
    _ownerAddress = msg.sender;
}
```

```solidity
// A modifier for checking if the `msg.sender` is the owner.
modifier onlyOwner() {
    require(msg.sender == _ownerAddress, "ERC20: Only owner can perform this action");
    _;
}

// Creates `_amount` tokens and assigns them to `_account`, increasing
// the total supply.
// Emits a `Transfer` event with `_from` set to the zero address.
function mint(address _account, uint256 _amount) public onlyOwner returns(bool) {
    require(_totalSupply + _amount <= _cap, "ERC20: cap exceeded");
    _totalSupply += _amount;
    _balances[_account] += _amount;
    emit Transfer(address(0), _account, _amount);
    return true;
}
```

_FirstErc20.sol_:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract FirstErc20 {
    // Mapping from account addresses to current balance.
    mapping (address => uint256) private _balances;

    // Mapping from account addresses to a mapping of spender addresses to an amount of allowance.
    mapping (address => mapping (address => uint256)) private _allowances;

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

    constructor(string memory name,
                string memory symbol,
                uint8 decimals,
                uint256 amount2Owner,
                uint256 cap) public
    {
        require(cap >= amount2Owner, 'ERC20: amount exceeds cap');
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _cap = cap;
        _totalSupply = amount2Owner;
        _balances[msg.sender] = amount2Owner;
        _ownerAddress = msg.sender;
    }

    // A modifier for checking if the msg.sender is the owner.
    modifier onlyOwner() {
        require(msg.sender == _ownerAddress, "ERC20: Only owner can perform this action");
        _;
    }

    // Returns the name of the token
    function name() public view returns(string memory) {
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
    function cap() public view returns(uint256) {
        return _cap;
    }

    // Returns the amount of tokens owned by `_account`.
    function balanceOf(address _account) public view returns (uint256 ) {
        return _balances[_account];
    }

    // Moves `_amount` tokens from the caller's account to `_recipient`.
    // Returns a boolean value indicating whether the operation succeeded.
    function transfer(address _recipient, uint256 _amount) public returns (bool) {
        require(_balances[msg.sender] >= _amount, 'ERC20: transfer amount exceeds balance');
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
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowances[_owner][_spender];
    }

    // Moves `_amount` tokens from `_sender` to `_recipient` using the
    // allowance mechanism. `_amount` is then deducted from the caller's allowance.
    // Returns a boolean value indicating whether the operation succeeded.
    // Emits a `Transfer` event.
    function transferFrom(address _sender, address _recipient, uint256 _amount) public returns (bool) {
        require(
            _balances[_sender] >= _amount,
            "ERC20: transfer amount exceeds balance"
        );
        require(
            _allowances[_sender][msg.sender] >= _amount,
            "ERC20: transfer amount exceeds allowance"
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
    function mint(address _account, uint256 _amount) public onlyOwner returns(bool) {
        require(_totalSupply + _amount <= _cap, "ERC20: cap exceeded");
        _totalSupply += _amount;
        _balances[_account] += _amount;
        emit Transfer(address(0), _account, _amount);
        return true;
    }

    // Emitted when `_value` tokens are moved from one account (`_from`) to another (`_to`)
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Emitted when the allowance of a `_spender` for an `_owner` is set by
    // a call to `approve`. `_value` is the new allowance.
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
```

## **Inherit from Openzepplin contracts**

Implémenter des standards manuellement n'est pas recommandé.
Il est préférable d'hériter de code déjà existant, du code testé et utilisé par l'ensemble de la communauté.

## **Interactions between smart contracts**

Un smart contract peut appeler les fonctions d'un autre smart contract.
Une fois notre ERC-20 déployé, d'autres smart contracts peuvent interagir avec.  
Des smart contracts d'exchanges qui souhaiteraient effectuer des `transferFrom` et bouger des fonds, un smart contracts d'ICO qui effectueraient une vente de nos tokens, ou encore un smart contract d'une application.  
Afin d'interagir avec notre smart contract il faut fournir:

- l'interface de notre smart contracts (ou le code complet). Dans le cas d'un ERC-20 l'interface est connue de tous.
- l'adresse ou a été déployée notre smart contract.

Un smart contract d'ICO pour notre token:

_FirstIco.sol_:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./FirstErc20.sol";
contract FirstIco {
    // Declare a FirstErc20 contract
    FirstErc20 public token;

    // The price of 1 unit of our token in wei;
    uint256 public _price;

    // Address of token seller
    address payable private _seller;

    constructor(uint256 price, address payable seller, address erc20Address ) public {
        _price = price;
        _seller = seller;
        //Token is deployed at 0xac5F7C280cC297C8529d48609188ED7f96974d52
        token = FirstErc20(erc20Address);
    }


    function buy(uint256 nbTokens) public payable returns(bool){
        require(msg.value >= 0, "ICO: Price is not 0 ether");
        require(nbTokens * _price <= msg.value, "ICO: Not enough Ether for purchase");
        uint256 _realPrice = nbTokens * _price;
        uint256 _remaining = msg.value - _realPrice;
        token.transferFrom(_seller, msg.sender, nbTokens);
        _seller.transfer(_realPrice);
        if(_remaining > 0) {
            msg.sender.transfer(_remaining);
        }
        return true;
    }
}
```

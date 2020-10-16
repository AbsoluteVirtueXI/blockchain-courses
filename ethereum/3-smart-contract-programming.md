# **Smart contracts programming**

## First Token contract

_FirstToken.sol_

```solidity
// SPDX-License-Identifier: MIT                 r
pragma solidity >=0.6.0;

// Contrat FistToken à améliorer dans les exercices
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

## EIP: Ethereum Improvement Proposals

EIPs website: https://eips.ethereum.org/

Ethereum est un écosystème récent, beaucoup reste à faire, et de nouvelles idées et innovations fleurissent constamment. Ce qui est un standard aujourd'hui sur Ethereum, le reste très rarement pour longtemps.  
Ethereum a mit en place un protocole pour gérer les propositions concernant de nouvelles fonctionnalités ou d'amélioration pour Ethereum: **EIP: Ethereum Improvement Proposals**.

> EIP stands for Ethereum Improvement Proposal. An EIP is a design document providing information to the Ethereum community, or describing a new feature for Ethereum or its processes or environment. The EIP should provide a concise technical specification of the feature and a rationale for the feature. The EIP author is responsible for building consensus within the community and documenting dissenting opinions.

Ces propositions sont conventionnellement nommées `EIP-XXXX`, `XXXX` un chiffre arbitrairement donné par le créateur de cet EIP, mais il est usuel que ce chiffre suive celui de la précédente EIP proposée.

Par exemple me modèle de token `ERC-20`a été introduit dans l'`EIP-20`: https://eips.ethereum.org/EIPS/eip-20  
Le modèle de token `ERC-721` a été introduit dans l'`EIP-721`: https://eips.ethereum.org/EIPS/eip-721

Lors de la rédaction d'un `EIP` le créateur propose sa vision à la communauté, d'abord en tant que brouillon, créant ainsi un débat qui entraîne souvent une modification ou une amélioration de sa vision originale.
Actuellement ce débat et les discussions relatives à la proposition d'un `EIP` s'effectue dans les `issues` de github: https://github.com/ethereum/EIPs/issues

## ERC-20

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

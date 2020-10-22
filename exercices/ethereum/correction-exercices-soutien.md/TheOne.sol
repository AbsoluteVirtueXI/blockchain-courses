// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract TheOne {
  // Quel est le type de mes variables ?
  // Quel est le type des arguments et de la valeur de retour de mes fonctions ?
  // Est ce que ma fonction peut recevoir de l'ether ? (payable ou pas ?)
  // Quel est la visibilité de mes variables et de mes fonctions ? (rien, view ou pure ?)
  function one() public pure returns (uint256) {
    return 1;
  }
}

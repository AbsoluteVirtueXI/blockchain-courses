// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract TheOne {
  // 1 Quel est le type de mes variables ?

  // 2 Quel est le type des arguments et de la valeur de retour de mes fonctions ?

  // 3 Est ce que ma fonction peut recevoir de l'ether ? (payable ou pas ?)

  // 4 Quelle visibilité pour ma fonction ? (public, private, internal, external) ?

  // 5 Quel est l'impact de ma fonction sur l'état du smart contract?
  // écrit/lit des variables ou aucuns des 2?  (rien, view ou pure )
  function one() public pure returns (uint256) {
    return 1;
  }
}

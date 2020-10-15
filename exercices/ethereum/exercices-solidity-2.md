Le lien vers les exercices d'aujourd'hui est dans un smart contract qui a été déployé à l'addresse: `0x2C308a229a537802fe9411F684930F2A205B6295` sur le réseau `rinkeby`.  
Le code du smart contract est:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0;

contract WhereAreTheExercices {
    string private exoLink;
    constructor(string memory _exoLink) public {
        exoLink = _exoLink;
    }

    function getExoLink() public view returns(string memory) {
        return exoLink;
    }
}

```

En faisant appel à la fonction `getExoLink()` vous recevrez le lien des exercices.

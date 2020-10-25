# **TP REFERENDUM**

Il vous vaudra créer un contrat qui puisse gérer un système de referendum.
Des utilisateurs peuvent soumettre des propositions qui seront soumises aux membres de l'assemblée.  
Les membres de cette assemblée voteront ensuite `Yes`, `No` our `Blank` (pour vote blanc).
Voici un exemple d'une structure `Proposal`:

```solidity
struct Proposal{
        uint id; // id de la proposition
        bool active; // proposition toujours active pour être votée
        string question // la proposition
        string description; // une description de la proposition
        uint forVotes; // nombre de vote `Yes`
        uint againstVotes; // nombre de vote `No`
        uint blankVotes; // nombre de vote `Blank`
        uint delay; // date à laquelle la proposition ne sera plus valide
        mapping (address => bool) didVote; // mapping pour verifier si
    }
```

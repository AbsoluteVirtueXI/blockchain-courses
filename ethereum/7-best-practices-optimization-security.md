# Best practices

## Use Openzepplin lib, don't write your own code

ERC20/ERC721/ERC777/ERC155
SafeMath, Counters, Ownable,
The objective of a developper is to write less code as possible.

> “Good programmers write good code. Great programmers write no code. Zen programmers delete code.”

## last compiler please 0.7.X PLEASE!!!

## Code style and design guidelines:

Follow https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/GUIDELINES.md
Config repository of all openzepllin config file:  
https://github.com/OpenZeppelin/code-style
Follow https://docs.soliditylang.org/en/latest/style-guide.html

## Work with interface registration

erc165 and more ?

## upgradable smart contract

example

## Prefer the ERC667 + ERC 20 + ERC165 = ERC777

tokenreceived, no approve and no token lock ?? please demo

## Favor pull over push for externals call and payment

There is a security flaw for this.

## NATSPEC and documentation generation

find the solidity natspec binary for libraries generation

## smart contract file name shoudl match smart contract name

## use contract name in revert message

# Optimization

MUST READ:
https://medium.com/coinmonks/gas-optimization-in-solidity-part-i-variables-9d5775e43dde

Some of the techniques we cover will violate well known code patterns. Before optimizing, we should always consider the technical debt and maintenance costs we might incur.

Optimization is the art of saving gas for user  
https://ethereum.stackexchange.com/questions/28813/how-to-write-an-optimized-gas-cost-smart-contract

2 way variable packing and no more useless code

All gas cost are in appendix G https://ethereum.github.io/yellowpaper/paper.pdf
Here is a spreadsheet of all the OPCODE 2017-04-12:
https://docs.google.com/spreadsheets/d/1n6mRqkBz3iWcOlRem_mO09GtSKEKrAsfO7Frgx18pNU/edit#gid=0

Please check maybe old one: https://docs.google.com/spreadsheets/d/1m89CVujrQe5LAFJ8-YAUCcNK950dUzMQPMJBxRtGCqs/edit#gid=0

## variable packing

How are stored variable in storage, struct too

## short revert message

## only index revelant variable in event, indexed cost gas

# Security

## security tools

### manticore by trail of bits

https://github.com/trailofbits/manticore
view demo

oyente mithril

### other tools

...

## Consensys smart contract best practice

https://consensys.github.io/smart-contract-best-practices/

## reentrency DAO flax

## integer overflow

## integer underflow

## DDOS

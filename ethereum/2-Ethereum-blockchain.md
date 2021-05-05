# Ethereum

## Ethereum vs Bitcoin

Bitcoin white paper: https://bitcoin.org/bitcoin.pdf  
Ethereum yellow paper: https://ethereum.github.io/yellowpaper/paper.pdf

Technically Ethereum and Bitcoin follow the same scheme in their implementation, but there are 3 main differences between these 2 blockchains:

- Ethereum has a virtual machine which can execute instructions and store data.
- Ethereum offers the possibility of deploying and using `smart contracts`, an enhanced version of the Bitcoin `Script`. The instructions of `smart contracts` are executed in the `EVM` and data are stored in the `EVM`.
- Ethereum introduced `Gas`, an enhanced system of miners fees on Bitcoin.

## EVM

The Ethereum Virtual Machine (`EVM`) is a powerful, sandboxed virtual stack embedded within each full Ethereum node, responsible for executing contract bytecode. Contracts are typically written in higher level languages, like Solidity, then compiled to `EVM` bytecode.  
This means that the machine code is completely isolated from the network, filesystem or any processes of the host computer. Every node in the Ethereum network runs an `EVM` instance which allows them to agree on executing the same instructions. The `EVM` is Turing complete, which refers to a system capable of performing any logical step of a computational function.
For every instruction implemented on the `EVM`, a system that keeps track of execution cost, assigns to the instruction an associated cost in Gas units. When a user wants to initiate an execution, they reserve some Ether, which they are willing to pay for this gas cost.  
List of Gas used per pcode: https://docs.google.com/spreadsheets/d/1n6mRqkBz3iWcOlRem_mO09GtSKEKrAsfO7Frgx18pNU/edit#gid=0  
List of the EVM opcodes: https://ethervm.io/

## Smart contracts

A smart contract is a self-executing contract with the terms of the agreement between buyer and seller being directly written into lines of code.
Smart contracts permit trusted transactions and agreements to be carried out among disparate, anonymous parties without the need for a central authority, legal system, or external enforcement mechanism.
A smart contract is a set of functions and data stored in the EVM.  
Smart contract can execute instructions, but are limited by a small list of available opcodes and also by the `Gas limit`, the maximum amount of `Gas` a user is willing to pay.

## Gas

Only read-only transactions are free. Else the sender has to pay for the amount of `Gas` needed when he sends a transaction to the Ethereum blockchain.  
There are 3 main use cases of `Gas`:

- reward for the miner who mined the block. He will earn all the `Gas` cost spent for all the transactions per block mined.
- avoid `DDoS` attacks. As Transactions need an amount `Gas`, a `DDoS` attack need a huge amount of cryptocurrencies for paying this `Gas` cost.
- protection of the user. The `gasLimit` is used to protect the user from wasting his Ether because of a bug in a smart contract or estimation errors.

The well known analogy to understand `Gas` is car and fuel.  
If you own a car, and you need to drive it from point A to point B, you need an amount of fuel. In the same way, if you have some operations that you want to execute in the Ethereum EVM, you need `Gas`. With your car, the further you drive, the more fuel you need. In Ethereum, the more you compute, the more `Gas` you need.
The amount of `Gas` needed is specified in the Appendix G of the Yellow Paper.

The `gasPrice` is the value that the transaction sender is willing to pay per `Gas` unit.
Following the car/fuel analogy, if your car has a 50 liter tank, how much do you pay to completely fill the tank? The answer depends on the price per liter in the pump.  
It is the same with Ethereum and `Gas`, if you have a transaction that needs 10 gas to execute, the price you pay to execute that transaction depends on the price per unit of gas.

The `gasLimit` is the maximum `Gas` that the transaction sender is willing to spend executing that transaction. Sometimes when executing a transaction, you might not know exactly how much it is going to cost. Imagine a scenario where you have a smart contract with a bug, an infinity loop. Without a gasLimit, it would be possible to consume the whole balance of the sender account. The `gasLimit` is a safety mechanism to prevent someone from using all their Ether due to a bug or an estimation error.

So when a user sends a transaction he will pay a first amount of:  
**Intial cost = `gasPrice` \* `gasLimit`**  
If the intrinsic cost is higher than the balance of the sender account, the transaction is considered invalid. After the transaction has been processed, any unused gas is refunded to the sender account. So a user will pay when the transaction has ben processed:  
**Real cost = `gasPrice` \* `gasUsed`**  
However, if your transaction runs out of gas during execution, there is no refund. That is why usually the transaction sender sets the gasLimit to higher than the estimated amount of gas.

If the Ethereum network is not congested, costs and `gasPrice` are cheap. This is why they are expressed in a smaller denomination than Ether:

| Unit                | Wei Value | Wei                       |
| ------------------- | --------- | ------------------------- |
| wei                 | 1 wei     | 1                         |
| Kwei (babbage)      | 1e3 wei   | 1,000                     |
| Mwei (lovelace)     | 1e6 wei   | 1,000,000                 |
| Gwei (shannon)      | 1e9 wei   | 1,000,000,000             |
| microether (szabo)  | 1e12 wei  | 1,000,000,000,000         |
| milliether (finney) | 1e15 wei  | 1,000,000,000,000,000     |
| ether               | 1e18 wei  | 1,000,000,000,000,000,000 |

<br />
A miner will always prioritize transactions with higher Gas cost.  
People sending transactions specify a gas price, and miners decide which transactions to mine into a block. The two meet somewhere in the middle on a price.

When sending a transaction, it can be hard to know what is the minimum gasPrice at that moment. There are some tools that scan the network and the average gasPrice used in recent transactions to help with choosing a fair gasPrice that is likely to be accepted by miners:  
ETH Gas station: https://ethgasstation.info/  
Etherscan Gas tracker: https://etherscan.io/gastracker  
Browser addons: https://addons.mozilla.org/en-US/firefox/addon/ethereum-gas-price-extension/

# MetaMask

A crypto wallet & gateway to blockchain apps

## Installation

Download from MetaMask browser extension from: https://metamask.io/

## Configuration

Setup a password and keep your seed phrase in a safe place.

## Networks

5 known networks:

- Mainnet => The real Ethereum network, no joke here!!!
- Ropsten
- Kovan
- Rinkeby
- Goerli

We can also configure personal networks, it will be useful when we will run our local `ganache` node.

Networks comparison: https://ethereum.stackexchange.com/questions/27048/comparison-of-the-different-testnets

## Faucets

All test networks provide faucets platform for getting testnet Ethers.

- Ropsten: https://faucet.ropsten.be/
- Kovan: https://faucet.kovan.network/
- Rinkeby: https://faucet.rinkeby.io/
- Goerli: https://goerli-faucet.slock.it/ ou https://faucet.goerli.mudit.blog/

## web3

While using MetaMask as a browser extension, the `web3` environment is injected into the browser. This way the browser can perform blockchain operation on Dapp through the MetaMask extension.  
MetaMask injects a global API into websites visited by its users at `window.ethereum`. This API allows websites to request users' Ethereum accounts, read data from blockchains the user is connected to, and suggest that the user sign messages and transactions. The presence of the provider object indicates an Ethereum user. MetaMask devs recommend using **detect-provider** package to detect our provider, on any platform or browser.  
**detect-provider**: https://www.npmjs.com/package/@metamask/detect-provider  
You can check in your browser console that `window.ethereum` and `window.web3` objects exist.  
Soon the `window.web3` will be removed following the MetaMask api documentation:
https://docs.metamask.io/guide/ethereum-provider.html#window-web3-removal  
So `window.ethereum` is the API to use for interacting with a browser.

# Transaction

## First transaction with MetaMask:

1. Create a second account in your MetaMask wallet.
2. Copy the Ethereum address of this new account in your clipboard.
3. Select an account that has testnet Ethers.
4. Click `Send`.
5. Copy the address of your second account in `Add Recipient`.
6. Select an amount to send, for example 1 `ETH`.
7. Click next and confirm. And wait a confirmation from MetaMask confirming your transaction.

## Analysis of a transaction:

In MetaMask, under `Activity` we can find an history of sent, received and rejected transactions. But there is not so much information we can read from there.
For getting a deeper overview of our transaction we can go on **Etherscan**.  
From MetaMask there is a link for viewing a specific transaction on Etherscan directly.
Etherscan website: https://etherscan.io/
Etherscan is an Ethereum explorer for getting informations on blocks, transactions, addresses and even smart contracts code.
You have to browse the Etherscan version of the network you want to get information from.

# Remix

Access to remix: http://remix.ethereum.org  
Remix is a web IDE (like CodePen for Javascript).
On remix we can write, deploy and depoy a contract. We can also interact with a deployed contract.  
Remix is pretty good for learning `Solidity` and test quickly small smart contracts, but it is not an option for serious project.

_remix live coding..._

# Ganache

Ganache is a local development Ethereum node, for fast deployment and testing.

## Install ganache

Install with `yarn`:

```zsh
% yarn global add ganache-cli
```

To have access to Yarn’s executables globally, you will need to set up the PATH environment variable in your terminal. To do this, add the line below into your profile, in my case my profile is in `~/.zprofile`:

````zsh
export PATH="\$PATH:`yarn global bin`"
```

and then load your profile, in my case `~/.zprofile`:
```zsh
source ~/.zprofile
````

## Execution

Simply run the `ganache-cli` from the command line.

```zsh
ganache-cli
```

# Deploy a Smart contract from Remix

A simple hello world smart contract:

_Hello.sol_:

```solidity
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;     // version du compilateur
contract HelloWorld {                        // Definition de notre contrat
     string public hello = "Hello world!";  // unne variable public de type string
}
```

## First smart contract on browser

## First smart contract on ganache

## First smart contract on a testnet

## SimpleStorage.sol

Deploy and use this smart contract:
_SimpleStorage.sol_:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private _storedData;

    function set(uint256 x) public {
        _storedData = x;
    }

    function storedData() public view returns (uint256) {
        return _storedData;
    }
}
```

# Glossary:

`Block header`: A data structure containing all information of a block. It is used as an identifier of a block  
`Block hash`: A Block Hash is a reference number for a block in the blockchain. You get a Block Hash by hashing the block header  
`Block reward`: The reward a miner get if he successfully mines a block. Actually 2 ETH on Ethereum  
`BTC`: Bitcoin cryptocurrency  
`DAO`: Decentralized Autonomous Organization  
`cryptographic hash`: see `hash`  
`cryptographic hash function`: see `hasing function`  
`Difficulty`: This describes how difficult, in relation to the genesis block, the target will be to reach.  
`DDoS`: Distributed Denial of Service  
`ECDSA`: Elliptic Curve Digital Signature Algorithm  
`EIP`: Ethereum Improvement Proposals
`ETH`: Ethereum/Ether cryptocurrency  
`EVM`: Ethereum Virtual Machine  
`Gas`:  
`gasLimit`:  
`gasPrice`:  
`Genesis block`: The first block of a blockchain `hash`: A unique identifier of a data. `hashing function`: take an input, file or data, and generate a `hash`of this input `PoW`: Proof of Work `PoS`: Proof of Stake `SPOF`: Single Point Of Failure `Target`: The number that the block hash must be less than in order to be valid

# Connecting to Public Test Networks with Truffle

**NOTE: This course assumes you have already set up a new Truffle project.**

## Available Testnets

There are four test networks available for you to choose, each with their own characteristics:

- **Ropsten id: 3**: The only proof-of-work testnet. It has unpredictable block times and frequent chain reorganizations. At the same time, it is the chain that most closely resembles mainnet.
- **Rinkeby id: 4**: A proof-of-authority network. This means that new blocks are added by a set of pre-defined trusted nodes, instead of by whichever miner provides a proof-of-work. It only works with Geth clients, and has 15-second block times.
- **Kovan id: 42**: Another proof-of-authority network, but this one runs only with Parity clients, and has 4-second block times.
- **Goerli id: 5**: Also a proof-of-authority network, but compatible with both Geth and Parity clients, with 15-second block times.

## Creating a New Account

To send transactions in a testnet, you will need a new Ethereum account. There are many ways to do this: here we will use the mnemonics package, which will output a fresh mnemonic (a set of 12 words) we will use to derive our accounts:

```zsh
% npx mnemonics
silver pupil shift lumber cluster dizzy ramp acquire video pioneer sauce deer
```

To access our mnemonics and Infura project id we will use environment variables.
Create a _.env_ file in the project root folder.  
Add `NNEMONIC` and `ENDPOINT_ID` as environment variables.  
_.env_:

```zsh
MNEMONIC="silver pupil shift lumber cluster dizzy ramp acquire video pioneer sauce deer"
ENDPOINT_ID="cc78ee77fa3c4d4297db69cca5b9df0e"
```

**WARNING**:

- Make sure to keep your mnemonic secure. Even if it is just for testing purposes, there are still malicious users out there who will wreak havoc on your testnet deployment for fun!
- Make sure to add _.env_ in your _.gitignore_ file

`Dotenv` is a zero-dependency module that loads environment variables from a _.env_ file into `process.env`.

```zsh
yarn add dotenv
```

## configuring networks

Since we are using public nodes, we will need to sign all our transactions locally. We will use @truffle/hdwallet-provider to do this, setting it up with our mnemonic. We will also tell the provider how to connect to the test network by using the Infura endpoint.

```zsh
% yarn add --dev @truffle/hdwallet-provider
```

Then, we will update our _truffle-config.js_ file with new connections to testnets:

_truffle-config.js_:

```javascript
/* eslint-disable camelcase */

const HDWalletProvider = require('@truffle/hdwallet-provider')
require('dotenv').config()
const mnemonic = process.env.MNEMONIC
const projectId = process.env.ENDPOINT_ID

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1', // Localhost (default: none)
      port: 8545, // Standard Ethereum port (default: none)
      network_id: '*', // Any network (default: none)
    },
    rinkeby: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          `https://rinkeby.infura.io/v3/${projectId}`
        ),
      network_id: 4,
      gas: 5500000,
      confirmations: 0,
      timeoutBlocks: 200,
      skipDryRun: true,
    },
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: 'native', // Fetch exact version from solc-bin (default: truffle's version)
    },
  },
}
```

## funding our new deployer account

To deploy on a public network, the deployer account need ethers.
The easiest way for getting all the generated accounts bound to our mnemonics is the truffle console:

```zsh
% npx truffle console --network rinkeby
```

And then use javascript `web3` functions for getting a list of all the accounts:

```zsh
truffle(rinkeby)> await web3.eth.getAccounts()
[
  '0x261B63E23eCAAc767Eb5d47F9Ee731651deF9c76',
  '0x8730d2185956D592d197beEc482b4e6632B6f8f3',
  '0xdfE3392BC894c22AE894577345D6E8B7E8F54774',
  '0x8135ef013e6a77Bb434c5e2f69a47796e1206AE1',
  '0x64d68464971126F06c0F0439E84C6c78c3d37e83',
  '0xC353733996fd4EfECb07f88a7CFD69c05B7aa416',
  '0x65BBDf74B9d20B2a3b75e2A2e9643b561b721B8C',
  '0x6Bc4eBE7096AE84570EF47c6bC389eF8FF452e71',
  '0x9Eeea75C80AaBfb98b9E97211bc6fF899f6c6Aaa',
  '0xBD8e7Ad3FC2A6Bfcba664C78DE5DdAFda171e789'
]
```

The first account, `accounts[0]`, is the default account used by truffle.  
Fund this account with ethers from MetaMask.  
So following the previous example, the account `0x261B63E23eCAAc767Eb5d47F9Ee731651deF9c76` will need some ethers for deploying our contracts.

## deploy

```zsh
% truffle migrate --network rinkeby
```

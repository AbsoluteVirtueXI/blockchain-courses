# Dapp architecture

## Standard network architecture

![Standard network architecture](../res/standard-network-architecture.png)

## Cloud network architecture: SaaS, Paas, IaaS

![Cloud network architecture](../res/cloud-network-architecture.png)

## Functional architecture of a decentralized web application

![Functional dapp architecture](../res/functional-dapp-architecture.png)
A Dapp developer use a wide range of technologies:

- **IDE**:  
  **VSCode**: An extensible code editor.

- **Languages**:  
  **html**: A language for structuring your web interface.  
  **css**: A language for making your web interface beautifull.  
  **javascript**: Javascript is used everywhere in a Dapp development.  
  It is use on the web interface for making your web interface dynamic, but also on the server side of your dapp.  
  **solidity** A language for smart contracts developement.  
  **SQL**: A language to access and modify data in a database.

- **Librairies**:  
  **react.js**: A library for building user interface. It generates html, css and javascript files for the front-end side.  
  **bootstrap**: A css library  
  **web3.js**: A library to interact with a local or remote ethereum node using HTTP, IPC or WebSocket. web3.js can be used on front-end and backend side of your dapp.
  **openzepplin**: A smart contracts library and templates.

- **JS runtime**:  
  **node.js**: node.js is a javascript runtime. It is used in all stages of your dapp development process. It provides a way to execute javascript on an operating system.
  node.js is used for running server side code, project management, dependencies management, testing and much more!!!

- **Dev tools**:  
  **truffle suite**: Truffle is a framework for smart contracts developement.  
  **openzepplin sdk**: Another framework for smart contracts development.

- **API**:  
  **INFURA**: INFURA is a service for communicating with the Ethereum blockchain.
  It is the gateway between our javascript code and Ethereum.
  An alternative to INFURA would be to connect directly to an Ethereum node, but it is less scalable.

- **Database**:  
  **Postgresql**: An SQL-like database. It is used to store persistent data.

- **Version control system**:  
  **git**: a console client for managing code version.  
  **github**: host a project initialized with **git**.

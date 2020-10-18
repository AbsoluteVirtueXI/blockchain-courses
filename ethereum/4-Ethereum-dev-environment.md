# **Ethereum dev environment**

## **Install the solc compiler**

**If something goes wrong while you are following the install instructions, please NO INITIATIVE, just report your problem to your instructor**.

As a lot of libraries and tools are configured for using the version `0.6.X` we will install the latest `0.6.X` version: the version `0.6.12`.  
We will install `solc` from the `solc-select` script, a script to quickly switch between Solidity compiler versions:
https://github.com/crytic/solc-select

Please follow the instructions bellow.

### Macosx

Download and install `docker` for mac: https://www.docker.com/get-started

When `docker`is installed, type the following commands in your termnial:

```zsh
% cd ~
% docker pull trailofbits/solc-select
% docker run --read-only -i --rm --entrypoint='/bin/sh' trailofbits/solc-select:latest -c 'cat /usr/bin/install.sh' > a.sh
% sed s+\'/usr/bin/solc\'+\'/usr/local/bin/solc\'+ a.sh > b.sh
% chmod a+x b.sh
% ./b.sh
% chmod a+x /usr/local/bin/solc
% rm a.sh b.sh
```

### Linux

```zsh
% cd ~
% git clone https://github.com/crytic/solc-select.git
% ./solc-select/scripts/install.sh
```

This will install `solc` into `~/.solc-select/`, so you have to add it to the `PATH` variable. Add this line, replacing **USERNAME** with your **username**, to your `~/.zshrc` or equivalent:

```zsh
export PATH=/home/USERNAME/.solc-select:$PATH
```

**The exact line and the file name should be printed at the end of the installation.**

### usage and configuration

When installed we can now check all available `solc` versions:

```zsh
% solc --versions
```

and check the current version actually in use:

```zsh
% solc --version
```

switch to version `0.6.12`:

```zsh
% solc use 0.6.12
```

check if current version is `0.6.12`:

```zsh
% solc --version
solc, the solidity compiler commandline interface
Version: 0.6.12+commit.27d51765.Linux.g++
```

## **Install solc extension for VSCode**

This extension provides syntax highlighting, some error checking and other tools while we are programming in Solidity.

Install the Solidity extension by Juan Blanco:
https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity

Set the `solc` version we will use while programming:

**A voir conflit entre installed version ?**

```txt
RIGHT CLICK on a `.sol` file -> Solidity: Change global compiler version(remote) -> choose 0.6.12
```

## **Truffle**

## **Openzepplin libraries**

##

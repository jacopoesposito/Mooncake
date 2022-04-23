# Mooncake
![GitHub](https://img.shields.io/github/license/jacopoesposito/mooncake?color=red&style=flat-square)

Mooncake is a de-centralized app based on Ethereum that implements a payment system for a general shop, made for the Computer Network Exam project at the University of Naples "Parthenope".

This DAPP allows users to buy products in two ways: by direct payment or by using their credit stored inside the blockchain.
Everytime users buy something by direct pay, the DAPP will calculate a 10% discount on the purchase and save it as a disposable credit inside the blockchain.

Build with Solidity, Javascript and love :heart:

## Requirements
- NodeJS
- Ganache
- Truffle 

## Installation 
* First make a clone of the repository
```
$ git clone https://github.com/jacopoesposito/Mooncake.git
```
* Move to the project's directory and run the command, if asked remember to don't overwrite all the files
```
$ truffle init 
```
* Open the file contracts/storePaymentsDiscount.sol and replace the two public addresses, contained in the addPaymentDiscount() function call inside the storePaymentsDiscount() constructor, with those of two existing accounts in Ganache.

* Bind Ganache with our truffle project and then execute the command.
```
$ truffle migrate --reset
```
* Now install all the NodeJS dependecies
```
$ npm install
```
* After the installation of all the dependencies, open the file src/js/index.js and modify the variables containing the addresses of the two contracts, receivePaymentAddress and storePaymentA, by entering the current addresses available on Ganache in the contracts section.

* Run it and have fun!

## Screenshot
[homepage.png](https://github.com/jacopoesposito/Mooncake/blob/main/static/image/login.png)
[logged.png](https://github.com/jacopoesposito/Mooncake/blob/main/static/image/connesso.png)

## License 
[GNU/GPL 3.0](https://choosealicense.com/licenses/gpl-3.0/)
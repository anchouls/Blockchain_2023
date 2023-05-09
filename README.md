# Smart Contract Practice Task

## Developed own version of currency exchange office.

Download dependencies: `npm install @openzeppelin/contracts`

### How it works:
There are 5 accounts:
1) token
2) token owner
3) exchanger
4) exchanger owner
5) buyer

* token owner creates token
* the owner of the exchanger creates the exchanger by passing the token address into the constructor
* the token owner transfers the tokens to the exchanger, now the exchanger has coins

Functionality:
* to buy, the buyer calls the exchanger with the buy function, specifying the amount and passing the amount*200 ether units
* to sell, the buyer calls the approve function from the token, where it gives the exchange address and the amount of coins the exchanger can manage. then it calls the sell function from the exchanger, where it gives the amount of coins it wants to sell
* the exchanger owner can call the withdraw function with the amount of ether it wants to withdraw from the exchanger's account

It was tested using Remix IDE

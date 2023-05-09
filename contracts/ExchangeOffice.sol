// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExchangeOffice {
    string public name = "Currency Exchange Office";
    ERC20 public token;
    uint public rate = 200; // 1 token = rate wei
    address owner;

    constructor(address externalToken) {
        owner = msg.sender;
        token = ERC20(externalToken);
    }

    function buy(uint amount) public payable returns (bool success) {
        require(amount > 0);
        uint cost = rate * amount;
        address _this = address(this);
        uint balance = token.balanceOf(_this);

        require(cost == msg.value);
        require(balance >= amount);

        token.transfer(msg.sender, amount);
        return true;
    }

    function sell(uint amount) public returns (bool success) {
        require(amount > 0);
        uint cost = rate * amount;
        address _this = address(this);
        uint senderTokenBalance = token.balanceOf(msg.sender);
        uint balance = _this.balance;

        require(senderTokenBalance >= amount);
        require(balance >= cost);

        token.transferFrom(msg.sender, _this, amount);
        address payable _to = payable(msg.sender);
        _to.transfer(cost);
        return true;
    }

    function withdraw(uint amount) public returns (bool success) {
        require(amount > 0);
        address payable _owner = payable(owner);
        address _this = address(this);

        require(_owner == owner);
        require(_this.balance >= amount);

        _owner.transfer(amount);
        return true;
    }
}

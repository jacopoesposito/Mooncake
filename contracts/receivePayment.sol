// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.9.0;

contract receivePayment {
  address public owner;
  uint private value;
  bytes private message;


  constructor() payable{
    
  }

  function receivePay() public payable {
    value = msg.value;
    message = msg.data;
    owner = msg.sender;
  }


}
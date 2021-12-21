// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.9.0;

contract storePaymentsDiscountB {

  function addPayment(uint _discount, address _idwallet) public {}
  function setBalance(address _idwallet, uint _discount) public {}
  function checkBalance(address _idwallet) public returns (uint discount) {}

}

contract receivePayment {
  /*uint public idwallet;
  uint private price;*/
  uint private discount;
  


  constructor() {
    
  }

  storePaymentsDiscountB sPD;

  function Existing(address _t) public {
      sPD = storePaymentsDiscountB(_t);
  }
  

  function receivePay(uint _price, address _t) public payable {
    require(msg.value == _price*10**18, 'Need to send enough ether'); //Need to convert _price in wei before the comparison

    discount = (_price*10)/100; //Set the discount percentage
    Existing(_t); //Creating a new instance of the smart contract StorePaymentDiscount 
    sPD.addPayment(discount, msg.sender); //Adding the information about the payment
  }

  function payWithBalance(uint _price, address _t) public payable{

    Existing(_t);
    uint _balance = sPD.checkBalance(msg.sender);
    if((_price - _balance) >= 0){ //Check that the balance is enough
      //uint _newPrice = _price - _balance;
      sPD.setBalance(msg.sender, 0); //Set the balance to 0
      payable(msg.sender).transfer(_balance*1 ether); //Return the money saved to the EOA

    }else{
      revert("There are some problems with your balance");
    }
  }


}
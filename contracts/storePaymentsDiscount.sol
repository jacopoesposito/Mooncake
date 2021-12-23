// SPDX-License-Identifier: GNU GPL 3.0
pragma solidity >=0.4.22 < 0.9.0;

contract storePaymentsDiscount {
    struct InfoPayment {
        address idwallet; //Used for mapping 
        uint discount; //Balance of the account
        bool exists; //Boolean value used to check if payment struct already exists
    }

    mapping(address => InfoPayment) public payments;
    InfoPayment[] paymentArray;

    constructor() {
        addPayment(1, 0x4f1Ce7d8C5083894CbA7cB95E03BDc0d7D9E38c8);
        addPayment(2, 0xBA715bB17Ec6f74fD84E8090194CAbF59E2C336b);
    }
    
    uint public paymentsCount;

    function addPayment(uint _discount, address _idwallet) public {
        if(!payments[_idwallet].exists){ //Checking if the balance is already present 
            payments[_idwallet] = InfoPayment(_idwallet, _discount, true); //If not, create the balance 
            paymentArray.push(payments[_idwallet]);
        }
        else{
            for(uint i = 0; i < paymentArray.length; i++){
                if(paymentArray[i].idwallet == _idwallet){
                    paymentArray[i].discount = paymentArray[i].discount + _discount; //Updating the balance 
                }
            }
            
        }
    }

    function setBalance(address _idwallet, uint _discount) public{
        for(uint i = 0; i < paymentArray.length; i++){
            if(paymentArray[i].idwallet == _idwallet){
                    paymentArray[i].discount = _discount; //Set the balance to the value _discount
            }
        }
    }

    function checkBalance(address _idwallet) public view returns (uint discount){
        for(uint i = 0; i < paymentArray.length; i++){
            if(paymentArray[i].idwallet == _idwallet){
                return paymentArray[i].discount;
            }
        }
    }
}


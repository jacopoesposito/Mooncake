pragma solidity >=0.4.22 < 0.9.0;

contract storePaymentsDiscount {
    struct InfoPayment {
        uint idwallet;
        uint discount;
        bool exists;
    }

    mapping(uint => InfoPayment) public payments;
    InfoPayment[] paymentArray;

    constructor() {
        addPayment(1, 2);
        addPayment(2, 3);
    }
    
    uint public paymentsCount;

    function addPayment(uint _discount, uint _idwallet) public {
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

    function setBalance(uint _idwallet, uint _discount) public{
        for(uint i = 0; i < paymentArray.length; i++){
            if(paymentArray[i].idwallet == _idwallet){
                    paymentArray[i].discount = _discount; //Set the balance to the value _discount
            }
        }
    }

    function checkBalance(uint _idwallet) public returns (uint discount){
        for(uint i = 0; i < paymentArray.length; i++){
            if(paymentArray[i].idwallet == _idwallet){
                return paymentArray[i].discount;
            }
        }
    }
}


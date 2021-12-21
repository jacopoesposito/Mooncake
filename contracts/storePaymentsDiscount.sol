pragma solidity >=0.4.22 < 0.9.0;

contract storePaymentsDiscount {
    struct InfoPayment {
        address idwallet;
        uint discount;
        bool exists;
    }

    mapping(address => InfoPayment) public payments;
    InfoPayment[] paymentArray;

    constructor() {
        addPayment(1, 0x5B5922E8BbcE08B19D15005a899A4E330096C940);
        addPayment(2, 0x6262D676b040E8dc2989dE00B3ad4D60A9eF07d0);
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


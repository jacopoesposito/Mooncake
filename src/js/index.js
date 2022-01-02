const ethereumButton = document.getElementById("metamaskLogin");
const payButton = document.getElementById("payButton");
const payWithBalanceButton = document.getElementById("payBalanceButton");
const showAccount = document.querySelector('.showAccount');
var account;
let abi;

const web3 = new Web3("ws://localhost:8545");
var contractRP;

//Address of the two smart contracts
var receivePaymentAddress = "0x654F7d4644e67D51Da8758395c0f509f9615a9e2";
var storePaymentA = "0xeB3e12b122d2F309CEE5618C0503bcc8a4f21217";

//get ABI of contracts
$.getJSON("../../build/contracts/receivePayment.json", function(result){
    abi = result.abi;
    if(typeof web3 !== 'undefined'){
        contractRP = new web3.eth.Contract(abi, receivePaymentAddress);
    }
});

ethereumButton.addEventListener('click', () => {
    getAccount();
});

payButton.addEventListener('click', () => {
    pay();
})

payWithBalanceButton.addEventListener('click', () => {
    payWithBalance();
})

async function getAccount() { //Connecting to MetaMask
    const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
    account = accounts[0];
    ethereumButton.remove();
    showAccount.innerHTML = account;
}

function pay() { //Emit a transaction to the contract Receive Payment while calling the method receivePay
    contractRP.methods.receivePay(10, storePaymentA).send({from: account, value: web3.utils.toWei("10"), gas:300000}).then(
        (result) => {
            alert(result);
        }
    ).catch((err) => {
        alert(err);  
    });
}

function payWithBalance(){ //Emit a transaction to the contract Receive Payment while calling the method payWithBalance
    contractRP.methods.payWithBalance(10, storePaymentA).send({from: account, value: web3.utils.toWei("10")}).then(
        (result) => {
            alert(result);
        }
    ).catch((err) => {
        alert(err);  
    });
}
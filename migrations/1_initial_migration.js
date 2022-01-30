const Migrations = artifacts.require("./contracts/receivePayment.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};

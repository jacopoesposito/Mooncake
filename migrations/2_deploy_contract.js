const Migrations = artifacts.require("./contracts/storePaymentsDiscount.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
var Migrations = artifacts.require("./Migrations.sol");
var Wayback = artifacts.require("./Wayback.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Wayback);
};

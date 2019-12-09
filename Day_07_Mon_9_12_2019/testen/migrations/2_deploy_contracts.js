var AutomaticTradeContract = artifacts.require("AutomaticTradeContract");
module.exports = function(deployer) {
	console.log("hier");
    deployer.deploy(AutomaticTradeContract);
    // Additional contracts can be deployed here
};
var AutomaticTradeContract = artifacts.require("AutomaticTradeContract");
module.exports = async function(deployer) {
    Hello = await AutomaticTradeContract.deployed()
	await deployer.deploy(AutomaticTradeContract, Hello.address); // supply address

    console.log(`AutomaticTradeContract is at address: ${Hello.address}`);
    console.log(`AutomaticTradeContract links to:      ${await Hello.AddressContract()}`);
    //console.log(`ContractBalance from AutomaticTradeContract:  ${await Hello.ContractBalance()}`)    
};
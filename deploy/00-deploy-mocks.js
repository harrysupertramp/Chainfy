//mocks is needed when we work in a localhost or hardhat network beacuse in this 
//environment we don't have any possibility of using oracle or similar technology, 
//for example the priceFeed, an off chain data
const { network } = require("hardhat")
const { developmentChains, constructor } = require ("../helper-hardhat-config")



module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy,log } = deployments
  const { deployer } = await getNamedAccounts()  

  if(developmentChains.includes(network.name)) {
    log("Local network detected! Deploying mocks..") 
    // await deploy("MockV3Aggregator",{// for the MockV3Aggregator.sol
    //   contract: "MockV3Aggregator",
    //   from: deployer,
    //   log: true, // it shows the tx, contract address and gas used
    //   args: [constructor],
    // })
    // log("Mocks deployed")
    await deploy("Chainfy", {
      from: deployer,
      args: [],
      log: true,
      args: ["Chainfy"], // this "Chainfy" is _contractName for the Constructor
      waitConfirmations: network.config.blockConfirmations || 1,
    })
  }

}

module.exports.tags = ["all", "mocks"] 
// yarn hardhat deploy --tags mocks
//it deploy only the mocks 

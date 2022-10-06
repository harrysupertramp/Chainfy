
// function deployFunc() {
//   console.log("Hi!!")
// }
// module.exports.default = deployFunc

// Instead of using the above form we prefer to use an async anonymous way, like below, even if there is no differences in the execution 

// module.exports = async (hre) => {
//   const { getNameAccounts, deployments } = hre
//   // hre.getNameAccounts()
//   // hre.deployments
// }

//const helperConfig = require("../helper-hardhat-config")
//const networkConfig = helperConfig.networkConfig
//const {networkConfig} = require("../helper-hardhat-config")
const { network } = require("hardhat")
const {verify} = require("../utils/verify")

// more hardcore way 
module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy,log } = deployments
  const { deployer } = await getNamedAccounts()  // in hardhat.config we can insert different accounts, in the networks part 
                                                // or create a namedAccounts part
  //const chainId = network.config.chainId

  //when we work for localhost or hardhatnetwork we want to use a mock

  const chainfy = await deploy ("Chainfy",{
    from: deployer,
    args: [],
    log: true,
    args: ["Chainfy"], // this "Chainfy" is _contractName for the Constructor
    waitConfirmations: network.config.blockConfirmations || 1,
  }) 
  verify

  const verify = async (contractAddress, args) => {
    console.log("Verifying contract...");
    try {
      await run("verify:verify", {  // in this way we are verifing the contract in etherscan
        address: contractAddress,
        constructorArguments: args,
      });
    } catch (e) {
      if (e.message.toLowerCase().includes("already verified")) {
        console.log("Already Verified!");
      } else {
        console.log(e);
      }
    }
  }
}

module.exports.tags = ["all", "chainfy"] 

//yarn hardhat deploy --network rinkeby --tags chainfy
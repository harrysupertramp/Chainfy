# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

<!-- Always the same 4 starting points -->

1 - yarn add --dev hardhat
2 - yarn hardhat --> Javascript project and it download autonomously: @nomicfoundation/hardhat-toolbox @nomicfoundation/     hardhat-network-helpers @nomicfoundation/hardhat-chai-matchers @nomiclabs/hardhat-ethers @nomiclabs/hardhat-etherscan chai ethers hardhat-gas-reporter solidity-coverage @typechain/hardhat typechain @typechain/ethers-v5 @ethersproject/abi @ethersproject/providers        
3 - yarn add --dev @openzeppelin/contracts
4 - yarn add --dev dotenv
 
<!-- this first 4 points are always the same -->

In case I need AggregatorV3 I've to digit:  -->  yarn add --dev @chainlink/contracts

5 - yarn add --dev hardhat-deploy --> in hardhat.config.js  require ("hardhat-deploy")yarn 
6 - yarn add --dev @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers

mocks is only for the localhost or hardahat networks developments

if we have different contract that need different solidity version we can handle this in hardhat.config.js adding different compiling versions in solidity field

in this lesson Patrick uses the priceFeed function of chainlink 
constructor

11:06:00 start talking about solidity order layout:
- type declaration 
- state variables 
- events 
- modifiers
- function: in order constructor receive fallback external public internal private and view/pure

12:20:00 adding Scripts on package.json
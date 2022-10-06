const { assert } = require("chai")
const { deployments, ethers, getNamedAccounts } = require("hardhat")

// yarn hardhat test --grep ""KEYWORD"
//in this way i only run the specific test:
// it("set the KEYWORD, async...)

describe("Chainfy", async function () {
  let chainFy
  let deployer
  beforeEach(async function () {
    // deploy the contract 
     deployer = (await getNamedAccounts()).deployer
    await deployments.fixture(["chainfy"]) //it run all the entire deploy folder according to the tags inside
    chainFy = await ethers.getContract("Chainfy")
  })

  describe("constructor", async function () {})
  it("set the correct name", async function() {
    const response = await chainFy.getContractName()
    console.log(response.toString)
    assert.equal(response, "Chainfy")
    
  })
})
const networkConfig = {
  4: {
    named: "rinkeby",
    ethUsdPriceFeed: "0x8...",
  },
  137: {
    named: "polygon",
    ethUsdPriceFeed: "0xfkn...",
  },
}

const developmentChains = ["hardhat", "localhost"] // for the mocks
const constructor = "constructor"

module.exports = {
  networkConfig,
  developmentChains,
  constructor,
}
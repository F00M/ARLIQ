require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.20",
  networks: {
    arc: {
      url: "RPC_ARC_TESTNET_MAS",
      accounts: ["PRIVATE_KEY_MAS"]
    }
  }
};

const hre = require("hardhat");

async function main() {
  const ARLIQ = "0x3Be143cf70ACb16C7208673F1D3D2Ae403ebaEB3";
  const USDC  = "0x3600000000000000000000000000000000000000";

  const DEX = await hre.ethers.deployContract("ARCLIQDEX", [
    ARLIQ,
    USDC
  ]);

  await DEX.waitForDeployment();
  console.log("ARCLIQ DEX deployed at:", DEX.target);
}

main();

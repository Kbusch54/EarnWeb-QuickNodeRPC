const hre = require("hardhat");

async function main() {
  const message = "KDB Rules";

  const GiveMe = await hre.ethers.getContractFactory("GiveMeETH");
  const giveMe = await GiveMe.deploy(message);

  await giveMe.deployed();

  console.log(
    `GiveMeETH deployed to ${giveMe.address} with message ${message}`
  );
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

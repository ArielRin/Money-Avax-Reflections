// scripts/verify.js
// deploy like this
// npx hardhat run scripts/verify.js --network <avalanche-network>
// dependencies may be needed use this Money
// npm install --save-dev hardhat hardhat-ethers hardhat-upgrades @nomiclabs/hardhat-avalanche

const { ethers, upgrades } = require('hardhat');

async function main() {
  const CONTRACT_ADDRESS = '0x123456788998976543'; // Replace with yours
  const CONTRACT_NAME = 'YourContractName'; // the contract name

  // Get the contract factory and signer
  const YourContract = await ethers.getContractFactory(CONTRACT_NAME);
  const contract = await upgrades.upgradeProxy(CONTRACT_ADDRESS, YourContract);

  // Verify
  console.log('Verifying contract on Avalanche...');
  await hre.run('verify:verify', {
    address: contract.address,
    constructorArguments: [], // Pass constructor arguments if any
  });

  console.log('Contract verified on Avalanche!');
}

// Run the script
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

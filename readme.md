# BabyMoneyAvaxRewards Solidity Contract


## Token Overview

Welcome to the official readme for our MoneyAvaxRewrds Token contract! This document aims to provide you with a comprehensive understanding of our tokenomics and the features that make our token unique.

BSCTestnet Successfully Deploy at 0xBB6047eBBf957FBBD59B48C0F5F451cC6ed87b20
Fuji C-Chain Test Alpha Deploy https://testnet.avascan.info/blockchain/c/token/0x46508bCbEa60573D66eAA7040eeFc5A074095c4e/contract

## Getting Started

To get started with our token, follow these steps:

1. **Acquire Tokens:** Purchase our tokens through supported exchanges.
2. **Hold:** Keep the tokens in your wallet to start earning reflections.
3. **Community Engagement:** Join our community channels to stay updated and engage with fellow token holders.
4. **Spread the Word:** Help us grow by sharing information about the token and its unique features.

## Tokenomics

**Token Supply:** 1 Quadrillion (1,000,000,000,000,000)

### Fees Breakdown

1. **Reflections Paid in WETHe (5%):**
   - 5% of each transaction is distributed to holders in WETHe.

2. **Liquidity Addition (2%):**
   - 2% of each transaction is added to the liquidity pool.

3. **Marketing Wallet (1%):**
   - 1% of each transaction is sent to the marketing wallet.

### General Information

- **Token Name:** BabyMoneyAvaxRewards Token
- **Token Symbol:** BabyMoneyAvaxRewards
- **Decimals:** 18

### Important Addresses

- **WETHe Address:** 0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB
- **Marketing Wallet Address:** 0x18Ff7f454B6A3233113f51030384F49054DD27BF

### Contract Information

- **Contract Name:** BabyMoneyAvaxRewards
- **Compiler Version:** Solidity 0.6.12 use this to redeploy on mainnet "Money"
- **License:** MIT
- **Documentation:** [Trader Joe XYZ Documentation](https://docs.traderjoexyz.com/) (for Avax network)

## Contract Overview

The BabyMoneyAvaxRewards contract is a Solidity smart contract developed for the Avax network. It introduces an innovative feature where holders receive reflections in WETHe (Wrapped Ether) on every transaction. The contract also includes liquidity addition, marketing wallet distribution, and has a total token supply of 1 quadrillion.

### Key Features

1. **Reflections in WETHe:**
   - Holders receive 5% of each transaction in WETHe through an auto-claim feature. Wrapped Ethereum on Avalanche (WETH.e) is a cross-chain asset that represents Ethereum (ETH) on the Avalanche blockchain. WETH.e facilitates seamless interoperability between the Ethereum and Avalanche ecosystems, allowing users to transfer and use ETH on Avalanche while benefiting from the network's high speed and low transaction fees. This wrapped token enhances liquidity and accessibility, enabling users to leverage the best features of both blockchains for a more versatile and efficient decentralized finance experience.

2. **Liquidity Addition:**
   - 2% of each transaction contributes to the liquidity pool to enhance trading liquidity. Adding to liquidity strengthens token community growth and stability by deepening market depth. This attracts more traders, reduces price volatility, and fosters a robust ecosystem, encouraging long-term investor confidence and participation.

3. **Marketing Wallet:**
   - 1% of each transaction is allocated to the marketing wallet for promotional activities. The marketing wallet receives its payment through the swapAndSendToFee function. This function is called during token transfers and is responsible for swapping a portion of the tokens to WETHe (wrapped Ethereum on Avax) and sending the resulting WETHe tokens to the marketing wallet.

4. **Quadrillion Token Supply:**
   - The contract has a total supply of 1 quadrillion tokens.

### External Dependencies

- **Uniswap Router:** Utilizes the Uniswap V2 Router for trading operations.
  - [UniswapV2Router02](https://etherscan.io/address/0xE3Ffc583dC176575eEA7FD9dF2A7c65F7E23f4C3) on Trader Joe's V2.0.

### Security Measures

- **Blacklist:** Certain addresses can be blacklisted, preventing them from participating in transactions.

### Auto-Claim and Gas Configuration

- **Gas for Processing:** 300,000
- **Claim Wait Time:** 1 hour (3600 seconds)

### Ownership and Control

- The contract is owned by an address specified in the `Ownable` contract.
- The owner has control over various parameters, including fees, marketing wallet address, and blacklisting.

### Dividend Tracker

- The contract incorporates a dividend tracker for managing dividend distribution to token holders in WETHe.
- Holders can claim dividends, and the tracker provides information about dividend history.

### Exclusions and Whitelisting

- Certain addresses can be excluded from fees and dividends.
- Automated market maker pairs are set and can be modified by the owner.

### Token Transfer and Fee Handling

- The `_transfer` function ensures proper handling of token transfers, fees, and auto-claiming of dividends.

### Liquidity and Swap Operations

- Liquidity addition and token swaps are handled through TraderJoe's router.
- The contract automatically swaps tokens for liquidity and sends dividends.

### Important Functions

- **updateDividendTracker:** Change the dividend tracker contract address.
- **updateUniswapV2Router:** Update the Uniswap router address.
- **excludeFromFees:** Exclude an address from fees.
- **setMarketingWallet:** Update the marketing wallet address.
- **setWETHeRewardsFee, setLiquiditFee, setMarketingFee:** Adjust fee percentages.
- **setAutomatedMarketMakerPair:** Set automated market maker pairs.
- **blacklistAddress:** Blacklist an address from participating in transactions.

### Dividend Tracker Contract

The contract utilizes the `BabyMoneyAvaxRewardsDividendTracker` contract for managing and distributing dividends to token holders. It includes features such as excluding addresses from dividends and adjusting claim wait times.


Thank you for being a part of our community! If you have any questions or need further assistance, feel free to reach out to our community moderators or refer to our official documentation. Together, let's build a strong and thriving community around our token!


## Disclaimer

This README provides an overview of the BabyMoneyAvaxRewards contract and its tokenomics. Users and developers are encouraged to review the code, documentation, and external dependencies for a comprehensive understanding. The contract and its features may be subject to updates or modifications by the contract owner. Use caution and conduct thorough due diligence when interacting with smart contracts.

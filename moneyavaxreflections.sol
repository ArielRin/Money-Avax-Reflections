// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/utils/SafeERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/security/ReentrancyGuard.sol";

contract MoneyAvaxReflectionToken is ERC20, Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    IERC20 private wethToken = IERC20(0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB);

    address public lpPair;
    address public marketingWallet;

    uint256 private constant MAX_SUPPLY = 10**24;
    uint256 private constant MAX_TX_PERCENT = 1;
    bool private tradeEnabled = false;

    constructor(
        address _marketingWallet
    ) ERC20("Money Avax Reflection Token", "MoneyAvaxReflections") {
        marketingWallet = _marketingWallet;
        _mint(msg.sender, 10**24); // Mint 1 quadrillion tokens with 9 decimal places
    }

    function setLpPair(address _lpPair) external onlyOwner {
        lpPair = _lpPair;
    }

    function enableTrade() external onlyOwner {
        require(!tradeEnabled, "Trading already enabled");
        tradeEnabled = true;
    }

    function transferOwnership(address newOwner) public override onlyOwner {
        require(newOwner != address(0), "Invalid new owner address");
        super.transferOwnership(newOwner);
    }

    function renounceOwnership() public override onlyOwner {
        super.renounceOwnership();
    }

    function transfer(address to, uint256 amount) public override nonReentrant returns (bool) {
        _checkMaxTx(amount);
        _tokenReflection(to, amount);
        _tokenLP(to, amount);
        _tokenMarketing(to, amount);
        super.transfer(to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public override nonReentrant returns (bool) {
        _checkMaxTx(amount);
        _tokenReflection(to, amount);
        _tokenLP(to, amount);
        _tokenMarketing(to, amount);
        super.transferFrom(from, to, amount);
        return true;
    }

    function _checkMaxTx(uint256 amount) internal view {
        require(amount <= (MAX_TX_PERCENT * MAX_SUPPLY) / 100, "Exceeds max transaction amount");
        require(tradeEnabled || msg.sender == owner(), "Trading not yet enabled");
    }

    function _tokenReflection(address to, uint256 amount) internal {
        uint256 reflectionAmount = (amount * 5) / 100;
        wethToken.transfer(to, reflectionAmount);
    }

    function _tokenLP(address to, uint256 amount) internal {
        if (lpPair != address(0)) {
            uint256 lpAmount = (amount * 2) / 100;
            super.transfer(lpPair, lpAmount);
        }
    }

    function _tokenMarketing(address to, uint256 amount) internal {
        uint256 marketingAmount = (amount * 1) / 100;
        super.transfer(marketingWallet, marketingAmount);
    }
}

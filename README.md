# Foundry Gold Token

A simple ERC20 token project built using Foundry, Anvil, and OpenZeppelin.

This project demonstrates:

* ERC20 token creation
* Owner-controlled minting
* Burnable token functionality
* ERC20 Permit (EIP-2612)
* Local deployment using Anvil
* Foundry testing setup

---

# Tech Stack

* Solidity ^0.8.27
* Foundry
* Anvil
* OpenZeppelin Contracts v5.x

---

# Contract Features

## Token Details

* Name: Gold
* Symbol: G
* Decimals: 18

## Functionalities

### Owner-only Minting

Only the contract owner can mint new tokens.

```solidity
function mint(address to, uint256 amount) public onlyOwner
```

### Burnable

Token holders can burn their own tokens.

### Permit Support

Gasless approvals using ERC20 Permit (EIP-2612).

### Initial Supply

Initial supply is minted to the owner during deployment.

```solidity
1,000,000 tokens
```

---

# Project Structure

```text
foundry-gold-token/
├── src/
│   └── Gold.sol
├── script/
│   └── DeployGold.s.sol
├── test/
│   └── GoldTest.t.sol
├── foundry.toml
└── README.md
```

---

# Local Development Setup

## Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

## Clone Project

```bash
git clone https://github.com/YOUR_USERNAME/Foundry-Gold-Token.git
cd Foundry-Gold-Token
```

## Install Dependencies

```bash
forge install
```

---

# Run Local Blockchain

Start Anvil:

```bash
anvil
```

Default RPC:

```text
http://127.0.0.1:8545
```

Chain ID:

```text
31337
```

---

# Compile Contracts

```bash
forge build
```

---

# Run Tests

```bash
forge test
```

Verbose mode:

```bash
forge test -vv
```

---

# Deploy to Local Anvil Chain

```bash
forge script script/DeployGold.s.sol:DeployGold \
--rpc-url http://127.0.0.1:8545 \
--private-key YOUR_ANVIL_PRIVATE_KEY \
--broadcast
```

---

# Mint Tokens from Terminal

Example: mint 100 tokens

```bash
cast send CONTRACT_ADDRESS \
"mint(address,uint256)" \
YOUR_WALLET_ADDRESS \
100000000000000000000 \
--private-key YOUR_PRIVATE_KEY \
--rpc-url http://127.0.0.1:8545
```

---

# Example Tests Included

* owner is set correctly
* initial supply validation
* owner-only minting
* burn functionality
* unauthorized mint prevention

---

# Future Improvements

Planned upgrades:

* staking contract
* treasury system
* vesting contract
* DAO governance
* token presale
* crowdfunding module
* advanced fuzz testing
* invariant testing

---

# Security Notes

This project uses OpenZeppelin Contracts for secure and battle-tested implementations.

No hidden taxes, blacklist logic, or unsafe admin backdoors are included.

---

# License

MIT

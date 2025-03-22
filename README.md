# Dynamic APR Staking Contract

A Solidity smart contract for staking tokens with a dynamic APR system that adjusts based on total value locked (TVL).

## Features

- Initial 250% APR that reduces as TVL increases
- Per-minute reward calculations
- Minimum 1-day staking period
- Emergency withdrawal with 50% penalty
- Dynamic reward rate adjustment
- Subgraph-friendly events
- Comprehensive view functions

## Contract Details

- Initial APR: 250%
- APR Reduction: 0.5% per 1000 tokens staked
- Minimum Lock Duration: 1 day
- Emergency Withdrawal Penalty: 50%
- Reward Calculation: Per minute
- Minimum APR: 10%

## Development

This project uses [Foundry](https://book.getfoundry.sh/) for development and testing.

### Prerequisites

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Installation

```bash
forge install
```

### Build

```bash
forge build
```

### Test

```bash
forge test
```

### Test Coverage

```bash
forge coverage
```

### Deployment

# Load environment variables
```bash
source .env
```

# Script for deployment
``` bash
forge script script/DeployStakingContract.s.sol:DeployStakingContract --rpc-url https://eth-sepolia.g.alchemy.com/v2/Your-Api-key --broadcast
```

# Script for verifying contract after deployment

``` bash
forge verify-contract <YOUR_CONTRACT_DEPLOYED_ADDRESS> src/StakingContract.sol:StakingContract --chain 11155111 --etherscan-api-key <YOUR_API_KEY> --constructor-args $(cast abi-encode "constructor(address,uint256,uint256,uint256,uint256)" 0x86aA2BCe8F297401baF7730421D90516783A707f 250 86400 5 50)

## Security Features

- Reentrancy protection
- Pausable functionality
- Owner controls
- Emergency withdrawal system
- Token recovery for wrong tokens
- Arithmetic overflow protection

## View Functions

- `getUserDetails`: Get comprehensive user staking information
- `getPendingRewards`: Calculate pending rewards
- `getTimeUntilUnlock`: Check remaining lock time
- `getTotalRewards`: Get total rewards in contract

## Events

All events include timestamps and relevant state changes for easy tracking and subgraph integration.

## License

MIT

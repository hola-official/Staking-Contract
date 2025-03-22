// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/StakingContract.sol";

contract DeployStakingContract is Script {
    function run() external {
        // Load the private key from environment variable for deployment
        bytes32 privateKeyBytes = vm.envBytes32("PRIVATE_KEY");
        uint256 deployerPrivateKey = uint256(privateKeyBytes);
        console.log(deployerPrivateKey);
        
        // Begin broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);
        
        // Set deployment parameters based on the "Staking Contract readme"
        address stakingTokenAddress = vm.envAddress("STAKING_TOKEN_ADDRESS"); // Your deployed ERC20 token address loading from your env file
        uint256 initialApr = 250; // 250% initial APR
        uint256 minLockDuration = 1 days; // 1 day minimum lock period
        uint256 aprReductionPerThousand = 5; // 0.5% (represented as 5 for the contract) reduction per 1000 tokens
        uint256 emergencyWithdrawPenalty = 50; // 50% penalty for emergency withdrawals
        
        // Deploy the contract
        StakingContract dynamicAprStaking = new StakingContract(
            stakingTokenAddress,
            initialApr,
            minLockDuration,
            aprReductionPerThousand,
            emergencyWithdrawPenalty
        );
        
        // Log the deployed contract address
        console.log("Dynamic APR Staking Contract deployed at:", address(dynamicAprStaking));
        console.log("Initial APR:", initialApr, "%");
        console.log("Minimum Lock Duration:", minLockDuration, "seconds (1 day)");
        console.log("Emergency Withdrawal Penalty:", emergencyWithdrawPenalty, "%");
        
        // End the broadcast
        vm.stopBroadcast();
    }
}
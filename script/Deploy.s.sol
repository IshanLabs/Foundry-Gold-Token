// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {Gold} from "../src/Gold.sol";

contract Deploy is Script{
    function run() external{
        vm.startBroadcast();
        new Gold(msg.sender);
        vm.stopBroadcast();
    }
}
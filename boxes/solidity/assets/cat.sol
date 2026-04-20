// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract Cat is Script {
    function run(string memory stdin) external {
        console.log(stdin);
    }
}

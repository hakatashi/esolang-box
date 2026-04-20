pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract Hello is Script {
    function run(string memory) external {
        console.log("Hello, World!");
    }
}

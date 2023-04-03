// https://github.com/t4sk/hello-foundry/blob/main/test/Auth.t.sol
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

// forge test --match-path test/Auth.t.sol -vvvv

contract AuthTest is Test {

    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        console.log("Owner Before", wallet.owner());
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
        console.log("Owner After", wallet.owner());
    }

    function testFailNotOwner() public {
        vm.prank(address(1));
        wallet.setOwner(address(1));

        console.log("owner", wallet.owner());
    }

    function testFailSetOwnerAgain() public {
        //msg.sender = address(this);
        wallet.setOwner(address(1));

        vm.startPrank(address(1));
        //msg.sender = address(1);
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        vm.stopPrank();

        console.log("owner", wallet.owner());

        wallet.setOwner(address(1));
    }

}

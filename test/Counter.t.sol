// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {SoulBound} from '../src/SoulBound.sol';

contract SoulBoundTest is Test {
    Counter public counter;
    SoulBound public soulbound;


    function setUp() public {
     
        soulbound = new SoulBound();
    }

    function testClaimToken() public{
        soulbound.claimToken(1);
    }

    function testSetURI() public{
        soulbound.setURI('advabnssmss');
    }

    function testMintToken() public{
        testSetURI();
        testClaimToken();
        

        soulbound.mintToken();
    }

    // function test_Increment() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testFuzz_SetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}

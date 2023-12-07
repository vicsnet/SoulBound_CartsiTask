// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {SoulBound} from '../src/SoulBound.sol';

interface CheatCodes {
    // Gets address for a given private key, (privateKey) => (address)
    function addr(uint256) external returns (address);
}

contract SoulBoundTest is Test {
 
    SoulBound public soulbound;


 address public addr1;
 address public addr2;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);


    function setUp() public {
     
        soulbound = new SoulBound();
          addr1 = cheats.addr(1);
          addr2 = cheats.addr(2);
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

        vm.prank(addr1);
        soulbound.mintToken();

        soulbound.transfer(addr2);
    }


}

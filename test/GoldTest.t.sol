// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "forge-std/Test.sol";
import "../src/Gold.sol";

contract GoldTest is Test {
    Gold public gold;

    address owner = address(1);
    address user = address(2);

    uint256 public constant INITIAL_SUPPLY = 1_000_000 * 10 ** 18;

    function setUp() public {
        vm.prank(owner);
        gold = new Gold(owner);
    }

    function testOwnerIsSetCorrectly() public view {
        assertEq(gold.owner(), owner);
    }

    function testInitialSupply() public view {
        assertEq(gold.totalSupply(), INITIAL_SUPPLY);
        assertEq(gold.balanceOf(owner), INITIAL_SUPPLY);
    }

    function testMint() public {
        uint256 amount = 1000 * 10 ** 18;

        vm.prank(owner);
        gold.mint(user, amount);

        assertEq(gold.balanceOf(user), amount);
        assertEq(
            gold.totalSupply(),
            INITIAL_SUPPLY + amount
        );
    }

    function testOnlyOwnerCanMint() public {
        uint256 amount = 100 * 10 ** 18;

        vm.prank(user);
        vm.expectRevert();
        gold.mint(user, amount);
    }

    function testBurn() public {
        uint256 mintAmount = 500 * 10 ** 18;
        uint256 burnAmount = 200 * 10 ** 18;

        vm.prank(owner);
        gold.mint(owner, mintAmount);

        vm.prank(owner);
        gold.burn(burnAmount);

        assertEq(
            gold.balanceOf(owner),
            INITIAL_SUPPLY + mintAmount - burnAmount
        );
    }
}
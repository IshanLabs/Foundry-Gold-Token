// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.6.0
pragma solidity ^0.8.27;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Gold is ERC20, ERC20Burnable, Ownable, ERC20Permit {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 * 10 ** 18;
    constructor(address initialOwner)
        ERC20("Gold", "GLD")
        Ownable(initialOwner)
        ERC20Permit("Gold")
    {
        _mint(initialOwner,INITIAL_SUPPLY);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

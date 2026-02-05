// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MintableToken
 * @dev An ERC20 token where the Owner can create (mint) new tokens at will.
 */
contract MintableToken is ERC20, Ownable {
    
    // 1. Setup the Token Name, Symbol, and Owner
    constructor(address initialOwner) 
        ERC20("Mintable Token", "MINT") 
        Ownable(initialOwner) 
    {
        // 2. Mint initial supply (e.g., 1000 tokens) to the deployer
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    /**
     * @dev Creates `amount` new tokens for `to`.
     * RESTRICTION: Only the contract owner can call this.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

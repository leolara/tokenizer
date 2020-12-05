// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.6.0 <0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
// import "@openzeppelin/contracts/math/SafeMath.sol";
import "./IVintage.sol";
import "hardhat/console.sol";

contract Vintage is ERC20, IVintage, Ownable {
    event VintageMinted(address to, string tokenURI);
    address private _owner;
    uint256 private _maxSupply;
    address private _project;
    uint256 private _vintagePeriod;

    constructor(string memory name, string memory symbol,
                address project, uint256 vintagePeriod)
    public
    ERC20(name, symbol) {
        _project = project;
        _vintagePeriod = vintagePeriod;
    }
    
    function project() public view override returns (address) {
        return _project;
    }

    function vintagePeriod() public view override returns (uint256) {
        return _vintagePeriod;
    }

    function maxSupply() public view override returns (uint256) {
        return _maxSupply;
    }

    function mint(uint256 amount) public override {
        // TODO
    }

    function retire(uint256 amount) public override {
        // TODO
    }
}

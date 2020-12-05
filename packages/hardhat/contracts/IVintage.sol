// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.6.0 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IVintage is IERC20 {
    function project() external view returns (address);
    function vintagePeriod() external view returns (uint256);
    function maxSupply() external view returns (uint256);
    function mint(uint256 amount) external;
    function retire(uint256 amount) external;
}

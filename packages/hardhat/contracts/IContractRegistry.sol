pragma solidity ^0.6.6;

interface IContractRegistry {
    function projectAddress() external view returns (address);

    function projectFactoryAddress() external view returns (address);
}

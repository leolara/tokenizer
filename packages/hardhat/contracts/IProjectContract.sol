pragma solidity >=0.6.0 <0.7.0;

interface IProjectContract {
    function vintageCount(string calldata) external view returns (uint256);

    function mintProject(
        address,
        string calldata,
        string calldata
    ) external returns (uint256);

    function ownerOf(uint256) external view returns (address);
}

pragma solidity >=0.6.0 <0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "./IContractRegistry.sol";
import "hardhat/console.sol";

//NiftyToken
contract ProjectContract is ERC721, Ownable {
    constructor() public ERC721("GameItem", "ITM") {}

    address public contractRegistry;

    //onlyOwner
    function setContractRegistry(address _address) public onlyOwner {
        contractRegistry = _address;
    }

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    using SafeMath for uint256;

    function mintProject(address to, string memory tokenURI)
        public
        returns (uint256)
    {
        // console.log(
        //     "projectFactoryAddress is ",
        //     IContractRegistry(contractRegistry).projectFactoryAddress()
        // );
        // require(
        //     msg.sender ==
        //         IContractRegistry(contractRegistry).projectFactoryAddress()
        // );
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        console.log("minting to ", to);
        console.log("newItemId is ", newItemId);
        _mint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    // function ink_mintProject(
    //     address to,
    //     string memory inkUrl,
    //     string memory jsonUrl
    // ) internal returns (uint256) {
    //     _tokenIds.increment();
    //     uint256 id = _tokenIds.current();
    //     _inkTokens[inkUrl].add(id);
    //     tokenInk[id] = inkUrl;

    //     _mint(to, id);
    //     _setTokenURI(id, jsonUrl);

    //     emit mintedInk(id, inkUrl, to);

    //     return id;
    // }

    //firstMint
    // function inkMmintProject(
    //     address to,
    //     string calldata inkUrl,
    //     string calldata jsonUrl
    // ) external returns (uint256) {
    //     require(msg.sender == "0xD2CAc44B9d072A0D6bD39482147d894f13C5CF32");
    //     _mintProject(to, inkUrl, jsonUrl);
    // }
}

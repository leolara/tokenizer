pragma solidity >=0.6.0 <0.7.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ProjectContract.sol";

//import "./IProjectContract.sol";

contract ProjectFactory is Ownable {
    event ProjectCreated(address sender, string purpose);

    string public projectName = "🛠 Project created";
    uint256 public projectId = 0;

    Project[] public projects;

    mapping(uint256 => address) public projectToOwner;
    mapping(address => uint256) ownerProjectCount;

    struct Project {
        string name;
        uint256 dna;
        uint32 level;
    }

    constructor() public {
        // what should we do on deploy?
    }

    // function projectContract() private view returns (IProjectContract) {
    //     return IProjectContract(0xD2CAc44B9d072A0D6bD39482147d894f13C5CF32);
    // }

    //function createProject(string memory newProjectName) public {
    function createProject(string memory newProjectName) public {
        // Check if it exists
        projectName = newProjectName;

        // projectId = projectContract().mintProject(msg.sender, "");
        ProjectContract projectContract = new ProjectContract(
            newProjectName,
            "PRO"
        );
        projectId = projectContract.mintProject(msg.sender, "");

        console.log(msg.sender, "created projectId", projectId);
        projects.push(Project(projectName, 1, 1));
        uint256 id = projects.length - 1;
        // console.log("projects - ", projects);
        projectToOwner[id] = msg.sender;
        ownerProjectCount[msg.sender]++;
        emit ProjectCreated(msg.sender, projectName);
    }

    //Creates it as first base
    // function createProjectLocal(string memory newProjectName) public {
    //     // require(ownerZombieCount[msg.sender] == 0);
    //     projectName = newProjectName;
    //     console.log(msg.sender, "created project", projectName);
    //     projects.push(Project(projectName, 1, 1));
    //     uint256 id = projects.length - 1;
    //     // console.log("projects - ", projects);
    //     projectToOwner[id] = msg.sender;
    //     ownerProjectCount[msg.sender]++;
    //     emit ProjectCreated(msg.sender, projectName);
    // }
}

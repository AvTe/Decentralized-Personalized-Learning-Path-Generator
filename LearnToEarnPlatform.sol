// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract LearnTokens is ERC20, Ownable {
    constructor(address initialOwner) ERC20("LearnToken", "LEARN") Ownable(initialOwner) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

contract LearningPathNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct LearningPath {
        string pathName;
        string metadata;
        uint256 createdAt;
        address creator;
    }

    mapping(uint256 => LearningPath) public learningPaths;

    constructor(address initialOwner) ERC721("LearningPathNFT", "LPNFT") Ownable(initialOwner) {}

    function createLearningPathNFT(
        address learner, 
        string memory pathName, 
        string memory metadata
    ) public returns (uint256) {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();

        _safeMint(learner, newTokenId);

        learningPaths[newTokenId] = LearningPath({
            pathName: pathName,
            metadata: metadata,
            createdAt: block.timestamp,
            creator: learner
        });

        return newTokenId;
    }

    function getLearningPath(uint256 tokenId) public view returns (LearningPath memory) {
        return learningPaths[tokenId];
    }
}

contract LearnToEarnPlatform is Ownable {
    LearnTokens public learnToken;
    LearningPathNFT public learningPathNFT;

    struct User {
        bool isRegistered;
        uint256 totalEarnedTokens;
        uint256[] completedPaths;
    }

    mapping(address => User) public users;

    event UserRegistered(address indexed user);
    event LearningPathCompleted(address indexed user, uint256 tokenId, uint256 tokensEarned);

    constructor(address initialOwner) Ownable(initialOwner) {
        learnToken = new LearnTokens(initialOwner);
        learningPathNFT = new LearningPathNFT(initialOwner);
    }

    function registerUser() public {
        require(!users[msg.sender].isRegistered, "User already registered");
        
        users[msg.sender] = User({
            isRegistered: true,
            totalEarnedTokens: 0,
            completedPaths: new uint256[](0)
        });

        emit UserRegistered(msg.sender);
    }

    function completeLearningPath(string memory pathName, string memory metadata) public {
        require(users[msg.sender].isRegistered, "User not registered");

        uint256 tokenId = learningPathNFT.createLearningPathNFT(msg.sender, pathName, metadata);
        uint256 tokensEarned = 100; // Base token reward

        learnToken.mint(msg.sender, tokensEarned);
        users[msg.sender].totalEarnedTokens += tokensEarned;
        users[msg.sender].completedPaths.push(tokenId);

        emit LearningPathCompleted(msg.sender, tokenId, tokensEarned);
    }

    function getUserCompletedPaths(address user) public view returns (uint256[] memory) {
        return users[user].completedPaths;
    }
}
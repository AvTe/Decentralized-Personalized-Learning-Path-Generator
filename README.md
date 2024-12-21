# Decentralized Personalized Learning Path Generator

## 🌟 Project Overview
Welcome to the **Decentralized Personalized Learning Path Generator**! Our mission is to revolutionize education by combining Web3, blockchain, and NFT technologies. This platform empowers learners with transparency, security, and rewarding experiences for skill-building and knowledge acquisition.

## 📜 Contract Address
```
0x0d63f710Df4AF3854440A4D356208aA41e6e0EB7
```

## 🚀 Project Vision
We aim to decentralize educational resources while gamifying the learning process. By integrating Web3, we foster:
- Engagement
- Ownership
- Innovation in personal and professional development

---

## 🔑 Key Features

### 🌐 Core Features
- **Personalized Learning Paths**
  - AI/ML-driven recommendations
  - Tailored experiences for every learner

### 🔗 Blockchain Features
- **NFT-Based Achievements**
  - Reward milestones with unique NFTs
  - Verifiable proof of skill and learning

### 💰 Tokenomics
- **LearnTokens (ERC-20)**
  - Earn rewards for active learning
  - Tradeable on Web3 marketplaces

---

## ⚙️ Technical Architecture
- **Smart Contracts**: Built using Solidity
- **Standards**: ERC-20 and ERC-721
- **Authentication**: Decentralized user access

### Smart Contract Components
1. **LearnTokens**: ERC-20 tokens for rewarding engagement
2. **LearningPathNFT**: ERC-721 tokens for milestone achievements
3. **LearnToEarnPlatform**: The main platform contract

---

## 🛠️ Getting Started

### Prerequisites
To interact with the platform, ensure you have:
- An **Ethereum Wallet** (e.g., MetaMask)
- Solidity compiler (`^0.8.19`)
- OpenZeppelin Contracts library

### Installation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/learning-path-generator.git
   ```

2. **Install Dependencies**:
   ```bash
   npm install
   ```

3. **Compile Smart Contracts**:
   ```bash
   npx hardhat compile
   ```

4. **Deploy to Blockchain**:
   Configure your network settings (e.g., Ethereum, Polygon) and run:
   ```bash
   npx hardhat run scripts/deploy.js --network yourNetwork
   ```

---

## 📚 Web3 Basics

### Common Web3 Commands
- **Connect Wallet**:
  ```javascript
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  await provider.send("eth_requestAccounts", []);
  const signer = provider.getSigner();
  console.log("Wallet connected: ", await signer.getAddress());
  ```

- **Read from Smart Contract**:
  ```javascript
  const contract = new ethers.Contract(contractAddress, abi, provider);
  const tokenBalance = await contract.balanceOf(userAddress);
  console.log("Token Balance: ", ethers.utils.formatUnits(tokenBalance, 18));
  ```

- **Write to Smart Contract**:
  ```javascript
  const contractWithSigner = contract.connect(signer);
  const tx = await contractWithSigner.transfer(recipient, amount);
  await tx.wait();
  console.log("Transaction Successful!");
  ```

---

## 🤝 Contribution
We welcome contributions from the community! Please check our [Contribution Guidelines](CONTRIBUTING.md) to get started.

---

## 📜 License
This project is licensed under the **MIT License**. Feel free to use and adapt it as needed.

---

## 📞 Contact
Have questions or suggestions? Reach out to the **Learn-to-Earn Platform Team** at:
- Email: amit.websitedev@gmail.com
- Linkedin: [Connect Us]((https://www.linkedin.com/in/amit-vishwakarma-b46380193/))

Let's revolutionize learning together!

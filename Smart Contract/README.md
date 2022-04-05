# What is smart contract?
Smart contracts are actually programs which are run on the blockchain.

Smart contracts work by following simple “if/when…then…” statements that are written into code on a blockchain. A network of computers executes the actions  when predetermined conditions have been met and verified. These actions could include releasing funds to the appropriate parties, registering a vehicle, sending notifications, or issuing a ticket. The blockchain is then updated when the transaction is completed. That means the transaction cannot be chaged, and only parties who have been granted permission can see the results.

Within a smart contract, there can be as many stipulations as needed to satisfy the participants that the task will be completed satisfactorily. To establish the terms, participants must determine how transactions and their data are represented on the blockchain, agree on the “if/when...then…” rules that govern those transactions, explore all possible exceptions, and define a framework for resolving disputes.

Then the smart contract can be programmed by a developer – although increasingly, organizations that use blockchain for business provide templates, web interfaces, and other online tools to simplify structuring smart contracts.

# Dapps
Decentralized applications—also known as "dApps" or "dapps"—are digital applications that run on a blockchain network of computers instead of relying on a single computer.
Because dApps are decentralized, they are free from the control and interference of a single authority.
Benefits of dApps include the safeguarding of user privacy, the lack of censorship, and the flexibility of development.
Drawbacks include the potential inability to scale, challenges in developing a user interface, and difficulties in making code modifications.

# DAOs
The DAO was an organization created by developers to automate decisions and facilitate cryptocurrency transactions. It acted as a form of venture capital fund, based on open-source code and without a typical management structure or board of directors. To be fully decentralized, the DAO was unaffiliated with any particular nation-state, though it made use of the ethereum network. 
# Chaincode
## What is hyperledger fabric?
Hyperledger is an enterprise-grade, open-source distributed ledger framework launched by the Linux Foundation in December 2015.

Fabric is a highly-modular, decentralized ledger technology (DLT) platform that was designed by IBM for industrial enterprise use.

The modular architecture of Hyperledger Fabric separates the transaction processing workflow into three different stages: smart contracts called chaincode that comprise the distributed logic processing and agreement of the system, transaction ordering, and transaction validation and commitment.
This segregation offers multiple benefits:
- A reduced number of trust levels and verification that keeps the network and processing clutter-free
- Improved network scalability
- Better overall performance
## What is chaincode?
Chaincode is a program, written in Go, node.js, or Java that implements a prescribed interface. Chaincode runs in a secured Docker container isolated from the endorsing peer process. Chaincode initializes and manages ledger state through transactions submitted by applications.

A chaincode typically handles business logic agreed to by members of the network, so it may be considered as a “smart contract”. State created by a chaincode is scoped exclusively to that chaincode and can’t be accessed directly by another chaincode. However, within the same network, given the appropriate permission a chaincode may invoke another chaincode to access its state.

There are three aspects to chaincode development:
- Chaincode Interfaces
- APIs
- Chaincode Responses
# Gas (Ethereum)
## What is gas?
On the Ethereum blockchain, gas refers to the cost necessary to perform a transaction on the network.

Miners set the price of gas based on supply and demand for the computational power of the network needed to process smart contracts and other transactions.

Priced in small fractions of the cryptocurrency ether (ETH), commonly referred to as gwei and sometimes also called nanoeth, the gas is used to allocate resources of the Ethereum virtual machine (EVM) so that decentralized applications such as smart contracts can self-execute in a secured but decentralized fashion.
## How does gas work?
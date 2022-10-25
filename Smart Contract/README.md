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
The London Upgrade was introduced in an effort to make Ethereum’s fees more predictable for users. It also introduced a burn mechanism into Ethereum, which is intended to offset the issuance of new ETH (there is no limit to how many ETH can be minted).

As of this upgrade, each block has a base fee, which is calculated by the network based on current demand for block space. This base fee gets burnt (destroyed), so users are now expected to include a tip or priority fee with each transaction — the higher the tip, the hope is, the more the transaction will be prioritized. This tip provides compensation to miners and the expectation is that most crypto wallets will integrate a feature that sets the tip fee automatically.

Calculating the total transaction fee works as follows: <b> Gas units (limit) * (Base fee + Tip) </b>

After the London Upgrade, Gas works like this:

1.    Assume Alice wants to send Bob 1 ETH. The Gas limit is 21,000 units, the base fee is 100 gwei, and Alice includes a tip of 10 gwei.

2.    The new formula is: Gas units (limit) x (Base fee + Tip). This can be calculated as 21,000 x (100 + 10) = 2,310,000 gwei or 0.00231 ETH.

3.    When Alice sends the ETH, 1.00231 ETH will be subtracted from her wallet. Bob will receive 1.0000 ETH. A miner will receive the tip of 0.00021 ETH. 0.0021 ETH will be burned.

Alice also has the ability to set a max fee for the transaction. The difference between the max fee and actual fee will be refunded. This allows users to set a maximum amount to pay for transactions without having to worry about overpaying. This makes things more predictable, as under the old transaction fee model, fees could wind up being higher than anticipated during times of extreme network congestion.
# Fork in blockchain
## Soft fork
A soft fork is a change to the software protocol where only previously valid transaction blocks are made invalid. Because old nodes will recognize the new blocks as valid, a soft fork is backwards-compatible. This kind of fork requires only a majority of the miners upgrading to enforce the new rules, as opposed to a hard fork that requires all nodes to upgrade and agree on the new version.

New transaction types can often be added as soft forks, requiring only that the participants (e.g. sender and receiver) and miners understand the new transaction type. This is done by having the new transaction appear to older clients as a "pay-to-anybody" transaction (of a special form) and getting the miners to agree to reject blocks including these transactions unless the transaction validates under the new rules.
A soft fork can also occur at times due to a temporary divergence in the blockchain when miners using non-upgraded nodes violate a new consensus rule their nodes don’t know about. 

Soft forks don't require any nodes to upgrade to maintain consensus, since all blocks with the new soft forked-in rules also follow the old rules, therefore old clients accept them. Soft forks cannot be reversed without a hard fork since a soft fork by definition only allows the set of valid blocks to be a proper subset of what was valid pre-fork. If users upgrade to a post-soft fork client and for some reason a majority of miners switch back to the pre-soft fork client, the post-soft fork client users would break consensus as soon as a block came along that didn't follow their clients' new rules. In order for a soft fork to work, a majority of the mining power needs to be running a client recognizing the fork. The more miners that accept the new rules, the more secure the network is post-fork. If you have 3/4 of miners recognizing the fork, 1/4 blocks created aren't guaranteed to follow the new rules. These 1/4 blocks will be valid to old nodes that aren't aware of the new rules, but they will be ignored by new nodes.

![alt](../imgs/soft%20fork.png "Soft fork")
## Hard fork
A hard fork refers to a radical change to the protocol of a blockchain network that effectively results in two branches, one that follows the previous protocol and one that follows the new version.

In a hard fork, holders of tokens in the original blockchain will be granted tokens in the new fork as well, but miners must choose which blockchain to continue verifying.

A hard fork can occur in any blockchain, and not only Bitcoin (where hard forks have created Bitcoin Cash and Bitcoin SV, among several others, for example).

A hard fork is when nodes of the newest version of a blockchain no longer accept the older version(s) of the blockchain; which creates a permanent divergence from the previous version of the blockchain.

Adding a new rule to the code essentially creates a fork in the blockchain: one path follows the new, upgraded blockchain, and the other path continues along the old path. Generally, after a short time, those on the old chain will realize that their version of the blockchain is outdated or irrelevant and quickly upgrade to the latest version.
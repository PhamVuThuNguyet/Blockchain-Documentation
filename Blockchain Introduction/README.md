# Introduction to blockchain
## What is blockchain?
Blockchain is a continuously growing list of records. Each record is called a block. They are linked and secured using cryptography.

Each block has its data, prev-hash, and hash. Prev-hash of the first block is all zeros.
## Benefits and drawbacks of blockchain
- Benefits:
  - Secure: Since it is an open source ledger, every transaction is made public. This leaves no room for fraud. The integrity of the blockchain is monitored by minors who have their eyes on all the transactions.
  - No third party interference: No government or financial institution has control of the cryptocurrencies based on blockchain technology. This means no government can meddle with the value of the currency.
  - Secure transactions: The blockchain responsible for keeping record of all the transactions cannot be edited or manipulated. Both ends of a transaction and the public can view the transaction data at any given time. This makes online transactions more secure.
  - Instant transactions: Blockchain technology transactions are completed in a few minutes. Take for example a bank transaction made to a person with a different bank account. It takes two days minimum to complete the transactions. At this time, the person doing virtual transactions with crypto can complete a series of transactions.
- Drawbacks:
  - Difficulties with Updating and Elimination of Errors: The application must be updated on each node of the P2P network or forked if any part of the nodes don’t accept the amendments.
  - Network Robustness for Dedicated Purposes: All applications have a business logic behind them. The logic defines how new applications must work in terms of business requirements. By nature, blockchain employs a strict logic that doesn’t allow redesign without the loss of benefits leading to the need for logical business changes to be acceptable to the blockchain solution.
  - Difficulty of Development: Applying very complex protocols to achieve consensus and allow for scaling from the beginning is very important. One cannot hastily implement an idea hoping to later add new features and expand the application without redeployment of the network or forking.

    Applications don’t normally require third-party APIs to store and retrieve data. The decentralized app shouldn’t also depend on other Dapps. This might sound good in theory but causes difficulties in practice.
    - Crime: Some applications need to verify the identity of a user since there is no central authority to assure the identity of the user, the development of certain decentralized apps becomes a serious problem.
    The anonymity or lack of user identification is a serious hindrance and is used by criminals to do illegal transactions.
    - Technology for the geeks: Most people consider the blockchain technology to be for tech savvy people. You have to be familiar with technology to make a transaction, store crypto, trade it and so much more.
    - Human error: The blockchain technology can’t be edited or modified meaning all the information on it has to be 100% accurate. If for example, you lose the Private Key used to access the blockchain, it’s almost impossible to get access to the network.

# Understand SHA256-Hash
## What is SHA256-Hash?
SHA256-Hash is a string of 64 characters long. It includes numbers 0-9, letters a-z, and special characters. It is called SHA256 because each hash take 256 bits.
## The 5 requirements for hash algorithms
- One-way: Cannot reverse hashed string to original document
- Deterministic: same docs -> same hashes
- Fast computation
- Avalanche effect: same doc, tiny change -> absolutely differrent hash string
- Must withstand collisions: 64 characters is limited -> may have same hashes for different docs -> must withstand
# Immutable ledger
## What is a ledger?
Ledger by definition it is a book of record keeping all the financial transactions of the organization. Today, with innovation, the information stored on computers is moving towards much higher forms which is cryptographically secured, fast and decentralized.
## What is centralized ledger?
Anything with a financial value is recorded in journals and posted to ledgers. These ledgers are just like the central repository of the posted transactions, and they are the backbone of any organization.
## What is decentralized ledger?
Decentralized ledger is a ledger or a system of records of any transactions or contracts maintained that are dispersed instead of reliant on and housed within one third-party system, such as a financial institution, eliminating the need for a central authority to keep a check against manipulation.

![alt](./imgs/cen%20vs%20decen.png "Centralized vs Decentralized System")

## What is immutable ledger?
Immutable ledger refers to any records that have the ability to remain unchanged. It cannot be altered and hence the data cannot be changed with ease, thereby making sure that the security is quite tight. Immutability means that it is very difficult to make changes without collusion. Each of the blocks of information like facts or transaction details is carried out with the help of a cryptographic principle or a hash value. Now, this hash value has an alphanumeric string generated by each block individually. Each of the blocks contains a hash value or digital signature for itself and for the previous one as well. This, in turn, makes sure that the blocks are retroactively coupled together and unrelenting. It is this functionality of blockchain technology that makes sure no one is able to interfere with the system or change the already saved data into the block.
## Centralized system vs Decentralized system
| Centralized system | Decentralized system |
| -------------------| ---------------------|
| One entity controls the entire system, where an entity can be a person or an enterprise | In a decentralized system, there could be multiple entities controlling the system. There is no single point of control, and the control is shared between various independent entities |
| All the constituting parts of the system, such as servers, ledgers, and so on, are co-located and exist at the same location | All the constituting parts of the system, such as servers, ledgers, and so on, are not co-located and exist at different locations |
# Distributed P2P network
## What is distributed network?
In a distributed system, all parts of the system are located in different physical locations. The processing is spread across multiple nodes, but decision making can be centralised or decentralised. Various nodes can communicate and coordinate by passing messages. 

A distributed system is similar to a decentralized one in that it doesn’t have a single central owner. But going a step further, it eliminates centralization. In a distributed system, users have equal access to data, though user privileges can be enabled when needed. The best example of a vast, distributed system is the internet itself.

The distributed system enables users to share ownership of the data. Hardware and software resources are also allocated between users, which in some cases may improve the performance of the system. A distributed system is safe from the independent failure of components, which can improve its uptime considerably.

Distributed blockchain systems are more secure as the system is spread across various nodes. A great example of a distributed system is AWS or cloud instances. Instead of data being stored in one single point, it is spread across various points across the server. Even if one node fails in these networks, it will not affect the entire system. 

![alt](./imgs/cen%20vs%20decen%20vs%20dis.png "Centralized vs Decentralized vs Distributed System")
## Distributed vs Decentralized
| Distributed system | Decentralized system |
| -------------------| ---------------------|
|The processing is spread across multiple nodes, but decision making can be centralised or decentralised|A decision is made across various nodes|
|Even if one node fails in these networks, it will not affect the entire system|Each node decides its behaviour, which ultimately affects the system’s behaviour|
||This is a subset of a distributed system|
# Accounting system
## What is double-entry accounting system?
This new form was developed almost 600 years ago with the purpose of making the accounting system more comprehensive and hence, instead of maintaining one ledger, the accountant keeps two; one for incoming and the other for outgoing.

Although the Double-Entry Accounting method of bookkeeping was much more advanced and efficient than Single-Entry Accounting, still there were several flaws in this too. As there was no connection between the different sets of Books, the records were separate and therefore, lacked in transparency and were difficult to verify. This led to a great trust deficit between the various stakeholders, like investors, lenders and/or the state.
## What is triple-entry accounting system?
The term Triple-Entry Accounting is somewhat misleading as there isn’t any third entry; instead, a third component is added to the debit and credit system. The common thread or the binding component is Blockchain that links the books together and helps in linking two separate double entries and can potentially be viewed for external auditing purposes.

So, instead of individual firms having their own books for the transaction, they go through a contract which evidently includes every aspect of a transaction; what the product was, who is the seller, who is the buyer, etc. and above all, it’s digitally signed.

In the Triple-Entry Accounting system, all accounting entries are cryptographically sealed by a third entry and thus, it works as a deterrent towards manipulations and financial fraud. In traditional Double-Entry Accounting a company’s ledger can be compromised by any of the weak human links, may be an employee or a bookkeeper or even an auditor. But this unique system of Triple-Entry Accounting leaves no space for any corrupt, weak human link as it is immutable.
# Consensus
## What is group consensus?
In simple terms, consensus refers to agreement on some decision by all members of a group, rather than a majority or a select group of representatives. The consensus process is what a group goes through to reach this agreement.
## Consensus protocol
### 2 main challenges
- Protect the network from attackers
- Competing chains: In a large blockchain, because it is distributed across the world, it can be a lag between nodes.
### Types of protocol
- Proof-of-Work
- Proof-of-Stake
- Others
### Proof-of-Work (PoW)
Proof of work (PoW) is a decentralized consensus mechanism that requires members of a network to expend effort solving an arbitrary mathematical puzzle to prevent anybody from gaming the system.

Proof of work is used widely in cryptocurrency mining, for validating transactions and mining new tokens.

Due to proof of work, Bitcoin and other cryptocurrency transactions can be processed peer-to-peer in a secure manner without the need for a trusted third party.

Proof of work at scale requires huge amounts of energy, which only increases as more miners join the network.
### Proof-of-Stake (PoS)
With proof-of-stake (POS), cryptocurrency owners validate block transactions based on the number of coins a validator stakes.

Proof-of-stake (POS) was created as an alternative to Proof-of-work (POW), the original consensus mechanism used to validate a blockchain and add new blocks.

Proof-of-stake (POS) is seen as less risky in terms of the potential for an attack on the network, as it structures compensation in a way that makes an attack less advantageous.
### PoW vs PoS
Proof of Stake (PoS) uses randomly selected miners to validate transactions. Proof of Work (PoW) uses a competitive validation method to confirm transactions and add new blocks to the blockchain.
# Types of blockchain
## Permissionless vs permissioned blockchains
All types of blockchains can be characterized as permissionless, permissioned, or both.  Permissionless blockchains allow any user to pseudo-anonymously join the blockchain network (that is, to become “nodes” of the network) and do not restrict the rights of the nodes on the blockchain network.

Conversely, permissioned blockchains restrict access to the network to certain nodes and may also restrict the rights of those nodes on that network.  The identities of the users of a permissioned blockchain are known to the other users of that permissioned blockchain.

Permissionless blockchains tend to be more secure than permissioned blockchains, because there are many nodes to validate transactions, and it would be difficult for bad actors to collude on the network.  However, permissionless blockchains also tend to have long transaction processing times due to the large number of nodes and the large size of the transactions. 

On the other hand, permissioned blockchains tend to be more efficient.  Because access to the network is restricted, there are fewer nodes on the blockchain, resulting in less processing time per transaction. 

![alt](./imgs/Permissionless%20vs%20permissioned.png "Permissionless vs Permissioned Blockchains")

There are four types of blockchain structures:
- Public blockchain
- Private blockchain
- Consorium blockchain
- Hybrid blockchain
## Public blockchain
Public blockchains are permissionless in nature, allow anyone to join, and are completely decentralized.  Public blockchains allow all nodes of the blockchain to have equal rights to access the blockchain, create new blocks of data, and validate blocks of data. 

To date, public blockchains are primarily used for exchanging and mining cryptocurrency.
## Private blockchain (Managed blockchain)
Private blockchains, which may also be referred to as managed blockchains, are permissioned blockchains controlled by a single organization. In a private blockchain, the central authority determines who can be a node.  The central authority also does not necessarily grant each node with equal rights to perform functions.  Private blockchains are only partially decentralized because public access to these blockchains is restricted. 
## Public blockchain vs private blockchain
|Basis of Comparision|Public Blockchain|Private Blockchain|
|-----|----|----|
|<b>Access|In this type of blockchain anyone can read, write and participate in a blockchain. Hence, it is permssionless blockchain. It is public to everyone|In this type of blockchain read and write is done upon invitation, hence it is a permissioned blockchain|
|<b>Network Actors|Don’t know each other|Know each other|
|<b>Type of Network|A public blockchain is decentralized|A private blockchain is more centralized|
|<b>Order of magnitude|The order of magnitude of a public blockchain is lesser than that of a private blockchain as it is lighter and provides transactional throughput|The order of magnitude is more as compared to the public blockchain|
|<b>Native Token|Yes|Not necessary|
|<b>Speed|Slow|Fast|
|<b>Transactions per Second|Transactions per second are lesser in a public blockchain|Transaction per second is more as compared to public blockchain|
|<b>Security|A public network is more secure due to decentralization and active participation. Due to the higher number of nodes in the network, it is nearly impossible for ‘bad actors’ to attack the system and gain control over the consensus networ|A private blockchain is more prone to hacks, risks, and data breaches/ manipulation. It is easy for bad actors to endanger the entire network. Hence, it is less secure|
|<b>Energy Consumption|A public blockchain consumes more energy than a private blockchain as it requires a significant amount of electrical resources to function and achieve network consensus|Private blockchains consume a lot less energy and power|
|<b>Consensus Algorithms|Some are proof of work, proof of stake, proof of burn, proof of space, etc.|Proof of Elapsed Time (PoET), Raft, and Istanbul BFT can be used only in case of private blockchains|
|<b>Attack|In a public blockchain, no one knows who each validator is and this increases the risk of potential collision or a 51% attack (a group of miners which control more than 50% of the network’s computing power.)|In a private blockchain, there is no chance of minor collision. Each validator is known and they have the suitable credentials to be a part of the network|
|<b>Effects|Potential to disrupt current business models through disintermediation. There is lower infrastructure cost. No need to maintain servers or system admins radically. Hence reducing the cost of creating and running decentralized application (dApps)|Reduces transaction cost and data redundancies and replace legacy systems, simplifying documents handling and getting rid of semi manual compliance mechanisms|
|<b>Examples|Bitcoin, Ethereum, Monero, Zcash, Dash, Litecoin, Stellar, Steemit, etc.|R3 (Banks), EWF (Energy), B3i (Insurance), Corda|
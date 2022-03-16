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
Ledger by definition it is a book of record keeping all the financial transactions of the organization.  Today, with innovation, the information stored on computers is moving towards much higher forms which is cryptographically secured, fast and decentralized.
## What is centralized ledger?
Anything with a financial value is recorded in journals and posted to ledgers. These ledgers are just like the central repository of the posted transactions, and they are the backbone of any organization.
## What is decentralized ledger?
Decentralized ledger is a ledger or a system of records of any transactions or contracts maintained that are dispersed instead of reliant on and housed within one third-party system, such as a financial institution, eliminating the need for a central authority to keep a check against manipulation.

<p align="center">
  <img src="./imgs/cen%20vs%20decen.png">
</p>

## What is immutable ledger?
Immutable ledger refers to any records that have the ability to remain unchanged. It cannot be altered and hence the data cannot be changed with ease, thereby making sure that the security is quite tight. Immutability means that it is very difficult to make changes without collusion. Each of the blocks of information like facts or transaction details is carried out with the help of a cryptographic principle or a hash value. Now, this hash value has an alphanumeric string generated by each block individually. Each of the blocks contains a hash value or digital signature for itself and for the previous one as well. This, in turn, makes sure that the blocks are retroactively coupled together and unrelenting. It is this functionality of blockchain technology that makes sure no one is able to interfere with the system or change the already saved data into the block.
## Centralized system vs Decentralized system
| Centralized system | Decentralized system |
| -------------------| ---------------------|
| One entity controls the entire system, where an entity can be a person or an enterprise | In a decentralized system, there could be multiple entities controlling the system. There is no single point of control, and the control is shared between various independent entities |
| All the constituting parts of the system, such as servers, ledgers, and so on, are co-located and exist at the same location | All the constituting parts of the system, such as servers, ledgers, and so on, are not co-located and exist at different locations |
# Distributed P2P network
## What is distributed network?
## Distributed vs Decentralized
# Accounting system
## What is double-entry accounting system?
This new form was developed almost 600 years ago with the purpose of making the accounting system more comprehensive and hence, instead of maintaining one ledger, the accountant keeps two; one for incoming and the other for outgoing.

Describing this transition, the accounting guru Yuji Ijiri explains, “First there was single entry bookkeeping — just writing down what happened. Then came a double-entry — what happened has to be explained by reasoning by another account.

Although the Double-Entry Accounting method of bookkeeping was much more advanced and efficient than Single-Entry Accounting, still there were several flaws in this too. As there was no connection between the different sets of Books, the records were separate and therefore, lacked in transparency and were difficult to verify. This led to a great trust deficit between the various stakeholders, like investors, lenders and/or the state.
## What is triple-entry accounting system?
The term Triple-Entry Accounting is somewhat misleading as there isn’t any third entry; instead, a third component is added to the debit and credit system. The common thread or the binding component is Blockchain that links the books together and helps in linking two separate double entries and can potentially be viewed for external auditing purposes.

So, instead of individual firms having their own books for the transaction, they go through a contract which evidently includes every aspect of a transaction; what the product was, who is the seller, who is the buyer, etc. and above all, it’s digitally signed.

In the Triple-Entry Accounting system, all accounting entries are cryptographically sealed by a third entry and thus, it works as a deterrent towards manipulations and financial fraud. In traditional Double-Entry Accounting a company’s ledger can be compromised by any of the weak human links, may be an employee or a bookkeeper or even an auditor. But this unique system of Triple-Entry Accounting leaves no space for any corrupt, weak human link as it is immutable.
# How mining work?
## The nonce
## The cryptographic puzzle
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
# How to create a blockchain?

# Cryptocurrency
Three important layers of crypto world:
- Technology
- Protocol / Coin
- Token
## What is cryptocurrency?
Cryptocurrency is a digital payment system that doesn't rely on banks to verify transactions. It’s a peer-to-peer system that can enable anyone anywhere to send and receive payments. Instead of being physical money carried around and exchanged in the real world, cryptocurrency payments exist purely as digital entries to an online database describing specific transactions. When you transfer cryptocurrency funds, the transactions are recorded in a public ledger. Cryptocurrency is stored in digital wallets.

Cryptocurrency received its name because it uses encryption to verify transactions. This means advanced coding is involved in storing and transmitting cryptocurrency data between wallets and to public ledgers. The aim of encryption is to provide security and safety.
## How does cryptocurrency work?
Units of cryptocurrency are created through a process called mining, which involves using computer power to solve complicated mathematical problems that generate coins. Users can also buy the currencies from brokers, then store and spend them using cryptographic wallets.

If you own cryptocurrency, you don’t own anything tangible. What you own is a key that allows you to move a record or a unit of measure from one person to another without a trusted third party.
## What is Bitcoin?
Bitcoin is not just a coin, not just a currency, but an actually protocol.

A protocol is a set of rules that guides how participants of a network communicate with each other (for examples: TCP/IP, HTTPS,...)

There are many protocol in crypto world, such as: Ethereum, Bitcoin, Ripple, Neo, Waves,... Each one of these protocols has its own coins.

The coin is an innate asset of the protocol which facilitates the interaction of players, which is used to reward people for mining the blockchain and adding blocks, or to purchase things from each other and so on.

Bitcoin ecosystem:
- Nodes
- Miners
- Large miners
- Mining pools
## Bitcoin's monetary policy
### The halving
Simply put, a Bitcoin halving is the process of halving the rewards of mining Bitcoin after each set of 210,000 blocks is mined. By reducing the rewards of mining Bitcoin as more blocks are mined, a Bitcoin halving limits the supply of new coins, so prices could rise if demand remains strong.

When bitcoin started in 2009, the block reward on successful mining of one block was 50 Bitcoin every 10 minutes. In November 2012, Bitcoin’s 1st Halving took place and the block reward reduced to half i.e., 25 Bitcoin from 50 Bitcoin. In July 2016 Bitcoin’s 2nd halving took place (reward reduces to 12.5 Bitcoin) and the next halving which is Bitcoin’s 3rd halving took place in May 2020 (reward reduced to 6.25 Bitcoin).

It also means that mining can get more complex over time. As network complexity rises with time and the payout rate decreases, each Bitcoin increases the real cost of mining, which will then also raise the market value of each Bitcoin. The reduced supply would also lead to a rise in Bitcoin prices as their scarcity also rises proportionately.
### Block frequency
Block frequency is described as how much the blocks join & split the incentive for Bitcoin, which is now 6.25 Bitcoin per block. For numerous cryptocurrencies, the Average Block-Time or Block Frequency is different. 
## What is Bitcoin mining in blockchain?
Bitcoin mining is the process by which bitcoin transactions are validated digitally on the bitcoin network and added to the blockchain ledger. It is done by solving complex cryptographic hash puzzles to verify blocks of transactions that are updated on the decentralized blockchain ledger. Solving these puzzles requires powerful computing power and sophisticated equipment. In return, miners are rewarded with bitcoin, which is then released into circulation hence the name bitcoin mining.
# Mining pool
## What is a mining pool?
A mining pool is a joint group of cryptocurrency miners who combine their computational resources over a network to strengthen the probability of finding a block or otherwise successfully mining for cryptocurrency.
## How mining pool works?
Individually, participants in a mining pool contribute their processing power toward the effort of finding a block. If the pool is successful in these efforts, they receive a reward, typically in the form of the associated cryptocurrency.

Rewards are usually divided between the individuals who contributed, according to the proportion of each individual's processing power or work relative to the whole group. In some cases, individual miners must show proof of work in order to receive their rewards.
### Mining pool methods
- Proportional mining pool: Miners contributing to the pool's processing power receive shares up until the point at which the pool succeeds in finding a block. After that, miners receive rewards proportional to the number of shares they hold.
- Pay-per-share mining pool: A miner contributing to this type of pool can exchange shares for a proportional payout at any time.   
- Peer-2-peer mining pool
# How mining work?
## The nonce
Nonce stands for "Number only used once". In a “proof of work” consensus algorithm, which bitcoin uses, the nonce is a random value used to vary the output of the hash value. Every block is supposed to generate a hash value, and the nonce is the parameter that is used to generate that hash value. It is a number added to a hashed, or encrypted block in a blockchain, that when rehashed, meets the difficulty level restrictions. The nonce is the number that blockchain miners are solving for. When the solution is found, the blockchain miners are offered cryptocurrency in exchange.

Nonces are difficult to find and are considered a way to weed out the less talented crypto miners.

The world of crypto mining is challenging, and one often needs excellent computational power to even begin to try and solve the nonce.

Nonces are used for a range of computer networking applications, including authentication for purchases, two-factor authentication, or other kinds of account recovery and identification.
## Nonce range
The nonce is not infinite. It is a 32-bits number, so it has a limitation at about 4x10^9 => One nonce range is not enough => Timestamp field
## The cryptographic puzzle
In essence, the block chain system or the algorithm will set a target. So there's a target that's set for miners to accomplish a certain hash. The way it works is any hash higher than target doesn't count. So if you find a hash for your block that is above the target, that's not good enough.

Miners want to find the right nonce that gives the good enough hash number.
# Cryptocurrency Transactions
## Signatures
### Private key
A private key is a secret number that is used in cryptography and cryptocurrency.

A private key is a large, randomly-generated number with hundreds of digits. For simplicity, they are usually represented as strings of alphanumeric characters.

A cryptocurrency wallet consists of a set of public addresses and private keys. Anyone can deposit cryptocurrency in a public address, but funds cannot be removed from an address without the corresponding private key.

Private keys represent final control and ownership of cryptocurrency. It is vitally important to prevent one's private keys from being lost or compromised.
### Public key
A public key is a cryptographic code used to facilitate transactions between parties, allowing users to receive cryptocurrencies in their accounts.

Users are issued a private key and a public key when first initiating a transaction.

The private key is made available only to its user and authorizes the user to facilitate transactions from their account.

The public key is used to verify the digital signature, which proves ownership of the private key.
### Private key vs Public key
|Key|Public key|Private key|
|---|----|-----|
|Algorithm|The public key is only used to encrypt data and to decrypt the data, the private key is used and is shared|Private Key is used to both encrypt and decrypt the data and is shared between the sender and receiver of encrypted data|
|Performance|The public key mechanism is slower|The private key mechanism is faster|
|Secret|The public key is free to use and the private key is kept secret only|The private key is kept secret and not public to anyone apart from the sender and receiver|
|Type|The private key mechanism is called symmetric being a single key between two parties|The public key mechanism is called asymmetric being two keys for different purposes|
|Sharing|The public key can be used by anyone but the private key is to be shared between two parties only|The private key is to be shared between two parties|
|Targets|Load testing checks the sustainability of the system|Performance testing checks the reliability, scalability, and speed of the system|
# Trustless system
A trustless system means that the participants involved do not need to know or trust each other or a third party for the system to function. In a trustless environment, there is no single entity that has authority over the system, and consensus is achieved without participants having to know or trust anything but the system itself.

The property of trustlessness in a peer-to-peer (P2P) network was introduced by Bitcoin, as it allowed all transactional data to be verified and immutably stored on a public blockchain.
# Types of token
A cryptographic token is a digital unit of value that lives on the blockchain. There are four main types:
- Payment tokens:
Payment tokens are coins. Their main purpose is to serve as a medium of exchange, store of value, and unit of account. Major cryptocurrencies like Bitcoin and Litecoin are payment tokens.
- Utility tokens:
These are tokens that give the holder access to a blockchain-based product or service.
For example, you can use Ether to access dapps or to pay for smart contracts to be executed on the Ethereum blockchain.
Similarly, Gas coins give you access to the NEO network.
- Security tokens:
Security tokens are traditional assets like stocks and shares that have been converted into a digital token on the blockchain.
Like traditional securities, security tokens give the holder ownership rights. For this reason, a growing number of regulators are controlling how they’re to be issued and traded.
Most regulators determine whether a token is a security token using some version of the Howey test — a test developed by the US Supreme Court in a case brought by the Securities and Exchange Commission.
According to this test, a token is a security token if it meets three criteria:
    - The holder has received the token in exchange for money that has been invested in a common enterprise
    - They expect to make a profit
    - They won’t do any of the work required to generate that profit.
- Non-fungible tokens:
A non-fungible token is a digital representation of something unique.
Each token represents a specific asset, so there’s no standard value. This means you can’t exchange one non-fungible token for the other directly.
# ERC 
## ERC-20
## ERC-721
## ERC-1155
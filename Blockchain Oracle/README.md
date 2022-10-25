# The Problem with Blockchain
Since the blockchain has its distributed ledger nature, each node in the network has to be able to find the same end result given the same input. Otherwise, when a node looks to validate a transaction another node makes, it would end up with a different result. This architecture is intentional, and it’s designed to be deterministic intentionally.

Let’s imagine an imaginary blockchain where they use APIs to validate each other's transactions. Let’s say we want to send a variable amount based on the price of ETH to Alice from Bob’s account. We would have our contract call an API to get the price of ETH and then send that amount to Bob. When every other node goes to verify this, they also have to call this API.

If they call the API even an instant later, the API could have changed — been depreciated, hacked, or for a number of other reasons — and all the nodes would get a different result. This means none of the nodes would be able to agree upon what the actual state of the blockchain is.

# What is a Blockchain Oracle?
Blockchain oracles are entities that connect blockchains to external systems, thereby enabling smart contracts to execute based upon inputs and outputs from the real world. 

Oracles provide a way for the decentralized Web 3.0 ecosystem to access existing data sources, legacy systems, and advanced computations. Decentralized oracle networks (DONs) enable the creation of hybrid smart contracts, where on-chain code and off-chain infrastructure are combined to support advanced decentralized applications (dApps) that react to real-world events and interoperate with traditional systems.

Oracles take on several key functions:

- Listen – monitor the blockchain network to check for any incoming user or smart contract requests for off-chain data.
- Extract – fetch data from one or multiple external systems such as off-chain APIs hosted on third-party web servers.
- Format – format data retrieved from external APIs into a blockchain readable format (input) and/or making blockchain data compatible with an external API (output).
- Validate – generate a cryptographic proof attesting to the performance of an oracle service using any combination of data signing, blockchain transaction signing, TLS signatures, Trusted - Execution Environment (TEE) attestations, or zero-knowledge proofs.
- Compute – perform some type of secure off-chain computation for the smart contract, such as calculating a median from multiple oracle submissions or generating a verifiable random number for a gaming application.
- Broadcast – sign and broadcast a transaction on the blockchain in order to send data and any corresponding proof on-chain for consumption by the smart contract.
- Output (optional) –  send data to an external system upon the execution of a smart contract, such as relaying payment instructions to a traditional payment network or triggering actions from a cyber-physical system.

Oracles retrieve and verify external data for blockchains and smart contracts through methods such as web APIs or market data feeds. The type of data required by smart contracts can include information on price feeds, weather information, or even random number generation for gambling. Leveraging oracles consists of querying the data source for specific information and subsequently connecting to that source to interface between the blockchain and the data feed. As a result, smart contracts can execute based on the particular information flowing from the data feed.

Data feeds in real-world markets and web APIs are usually not deterministic like blockchains and smart contracts. Oracles act as a bridge that can digest external and non-deterministic information into a format that a blockchain can understand and execute particular conditions with. Oracles can even be used for N-of-M multi-signature transactions to reach consensus on which transaction to sign, in relevant scenarios.

Oracles form the basis of platforms like Augur, which is a decentralized prediction market. However, Augur is more representative of a complex oracle itself that functions as a data feed based on the “Wisdom of the Crowd” where participant behavior effectively acts as the data source. Augur also utilizes oracles for reporting the correct result to prediction markets with an incentive structure driving honest reporting.

There are several forms of oracles including:
- Hardware Oracles: Sensors integrated with tangible physical objects. Primary examples would be in supply chain tracking with the use of RFID tags for feeding data like environmental conditions of products to the blockchain.
- Software Oracles: The most common form that pull data from third-party sources such as web APIs and can include real-world information like flight statuses and weather data.
- Consensus Oracles: Represent a step towards decentralized oracles and rely on aggregating data from several oracles with proprietary methods for determining their authenticity and accuracy.
- Inbound Oracles: Reflect “if this happens then do that” scenarios associated with software oracles such as “if this price is met by an asset, then trigger a sell.”
- Outbound Oracles: Allow smart contracts to send data to sources outside of the blockchain network they exist on and are also software oracles.

# Why is Oracle Needed?
Oracles solve this problem by posting the data on the blockchain. So any node replaying the transaction will use the same immutable data that's posted for all to see. To do this, an oracle is typically made up of a smart contract and some off-chain components that can query APIs, then periodically send transactions to update the smart contract's data.

# Why can't decentralized applications communicate with the real world without oracles?
There is a fundamental difference of formats. Blockchain is deterministic, meaning that is a reflection of a specific series of events which take place one after another in sequential order - series of transactions. Accessing information outside of the chain would require data points that are not sequential, and would therefore be impossible for Blockchain to use or make sense of. This aspect of Blockchain gives it immutability, but reduces flexibility.

The off-chain world, however, is non-deterministic, meaning that there is no recording of the events in the specific sequence that they have taken place, which creates problems with transparency. Data points can be generated from and understood at any point, providing increased flexibility, but difficulty in communicating with the Blockchain.

This foundational distinction makes the two worlds incompatible with each other by default, and only the presence of an oracle can make two-way communication between them possible.

# The Oracle Problem
The oracle problem revolves around a very simple limitation—blockchains cannot pull in data from or push data out to any external system as built-in functionality. As such, blockchains are isolated networks, akin to a computer with no Internet connection. The isolation of a blockchain is the precise property that makes it extremely secure and reliable, as the network only needs to form consensus on a very basic set of binary (true/false) questions using data already stored inside of its ledger. These questions include: did the public key holder sign the transaction with their corresponding private key, does the public address have enough funds to cover its transaction, and is the type of transaction valid within the particular smart contract? The very narrow focus of blockchain consensus is why smart contracts are referred to as being deterministic—they execute exactly as written with a much higher degree of certainty than traditional systems.

However, for smart contracts to realize upwards of 90% of their potential use cases, they must connect to the outside world. For example, financial smart contracts need market information to determine settlements, insurance smart contracts need IoT and web data to make decisions on policy payouts, trade finance contracts need trade documents and digital signatures to know when to release payments, and many smart contracts want to settle in fiat currency on a traditional payment network. None of this information is inherently generated within the blockchain, nor are these traditional services directly accessible.

Bridging the connection between the blockchain (on-chain) and the outside world (off-chain) requires an additional and separate piece of infrastructure known as an oracle.

# What is a Decentralized Oracle?
Blockchain oracle mechanisms using a centralized entity to deliver data to a smart contract introduce a single point of failure, defeating the entire purpose of a decentralized blockchain application. If the single oracle goes offline, then the smart contract will not have access to the data required for execution or will execute improperly based on stale data.
‍
Even worse, if the single oracle is corrupted, then the data being delivered on-chain may be highly incorrect and lead to smart contracts executing very wrong outcomes. This is commonly referred to as the “garbage in, garbage out” problem where bad inputs lead to bad outputs. Additionally, because blockchain transactions are automated and immutable, a smart contract outcome based on faulty data cannot be reversed, meaning user funds can be permanently lost. Therefore, centralized oracles are a non-starter for smart contract applications. 

A decentralized oracle or decentralized oracle network is a group of independent blockchain oracles that provide data to a blockchain. A DON combines multiple independent oracle node operators and multiple reliable data sources to establish end-to-end decentralization. Every independent node or oracle in the decentralized oracle network independently retrieves data from an off-chain source and brings it on-chain. The data is then aggregated so the system can come to a deterministic value of truth for that data point. Decentralized oracles solve the oracle problem.

# Types of Blockchain Oracles
Given the extensive range of off-chain resources, blockchain oracles come in many shapes and sizes. Not only do hybrid smart contracts need various types of external data and computation, but they require various mechanisms for delivery and different levels of security. Generally, each type of oracle involves some combination of fetching, validating, computing upon, and delivering data to a destination.

## Input Oracles
The most widely recognized type of oracle today is known as an “input oracle”, which fetches data from the real-world (off-chain) and delivers it onto a blockchain network for smart contract consumption. These types of oracles are used to power Chainlink Price Feeds, providing DeFi smart contracts with on-chain access to financial market data. 

## Output Oracles
The opposite of input oracles are “output oracles,” which allow smart contracts to send commands to off-chain systems that trigger them to execute certain actions. This can include informing a banking network to make a payment, telling a storage provider to store the supplied data, or pinging an IoT system to unlock a car door once the on-chain rental payment is made. 

## Cross-Chain Oracles
Another type of oracle are cross-chain oracles that can read and write information between different blockchains. Cross-chain oracles enable interoperability for moving both data and assets between blockchains, such as using data on one blockchain to trigger an action on another or bridging assets cross-chain so they can be used outside the native blockchain they were issued on.

## Compute-Enabled Oracles
A new type of oracle becoming more widely used by smart contract applications are “compute-enabled oracles,” which use secure off-chain computation to provide decentralized services that are impractical to do on-chain due to technical, legal, or financial constraints. This can include using Keepers to automate the running of smart contracts when predefined events take place, computing zero-knowledge proofs to generate data privacy, or running a verifiable randomness function to provide a tamper-proof and provably fair source of randomness to smart contracts.
![](../imgs/types%20of%20oracles.jpeg)

# Blockchain Oracle Use Cases
Smart contract developers use oracles to build more advanced decentralized applications across a wider range of blockchain use cases. While there are a potentially infinite number of possibilities, below are the use cases with the most current adoption.

## Decentralized Finance (DeFi)
A large portion of the decentralized finance (DeFi) ecosystem requires oracles to access financial data about assets and markets. For example, decentralized money markets use price oracles to determine users’ borrowing capacity and check if users’ positions are undercollateralized and subject to liquidation. Similarly, synthetic asset platforms use price oracles to peg the value of tokens to real-world assets and automated market makers (AMMs) use price oracles to help concentrate liquidity at the current market price to improve capital efficiency. 

## Dynamic NFTs and Gaming
Oracles enable non-financial use cases for smart contracts too such as dynamic NFTs—Non-Fungible Tokens that can change in appearance, value, or distribution based on external events like the time of day or the weather. Additionally, compute oracles are used to generate verifiable randomness that projects then use to assign randomized traits to NFTs or to select random lucky winners in high-demand NFT drops. On-chain gaming applications also use verifiable randomness to create more engaging and unpredictable gameplay experiences like the appearance of random loot boxes or randomized matchmaking during a tournament. 

## Insurance
Insurance smart contracts use input oracles to verify the occurrence of insurable events during claims processing, opening up access to physical sensors, web APIs, satellite imagery, and legal data. Output oracles can also provide insurance smart contracts with a way to make payouts on claims using other blockchains or traditional payment networks.

## Enterprise
Cross-chain oracles offer enterprises a secure blockchain middleware that allows them to connect their backend systems to any blockchain network. In doing so, enterprise systems can read/write to any blockchain and perform complex logic on how to deploy assets and data across chains and with counterparties using the same oracle network. The result is institutions being able to quickly join blockchains in high demand by their counterparties and swiftly create support for smart contract services wanted by their users without having to spend time and development resources integrating with each individual blockchain.

## Sustainability
Hybrid smart contracts are advancing environmental sustainability by creating better incentives to partake in green practices through advanced verification techniques around the true impact of green initiatives. Oracles are a critical tool to supplying smart contracts with environmental data from sensor readings, satellite imagery, and advanced ML computation, which then allow smart contracts to dispense rewards to people practicing reforestation or engaging in conscious consumption. Oracles are also supporting many new forms of carbon credits to offset the impacts of climate change.
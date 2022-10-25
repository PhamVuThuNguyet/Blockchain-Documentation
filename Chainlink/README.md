# Chainlink

## Chainlink Architecture

### Basic Request Model
Chainlink connects smart contracts with external data using its decentralized oracle network. Chainlink API requests are handled 1:1 by an oracle.

The Basic Request Model describes the on-chain architecture of requesting data from a single oracle source.

![](../imgs/chainlink%20architecture.png)

#### Chainlink Client
ChainlinkClient is a parent contract that enables smart contracts to consume data from oracles. It's available in the Chainlink smart contract library which can be installed using the latest package managers.

The client constructs and makes a request to a known Chainlink oracle through the transferAndCall function, implemented by the LINK token. This request contains encoded information that is required for the cycle to succeed. In the ChainlinkClient contract, this call is initiated with a call to sendChainlinkRequestTo.

#### LINK Token
LINK is an ERC-677 compliant token, a standard allow tokens to be transferred to contracts and have the contract trigger logic for how to respond to receiving the tokens within a single transaction, which implements transferAndCall, a function that allows tokens to be transferred whilst also triggering logic in the receiving contract within a single transaction.

#### Oracle Contract
Oracle contracts are owned by oracle node operators, which run alongside off-chain oracle nodes.

##### Request
The client contract that initates this cycle must create a request with:
- The oracle address
- The job ID, so the oracle know what tasks to perform
- The callback function, which the oracle will send the response to

Oracle contracts are responsible for handling on-chain requests made through the LINK token, by implementing onTokenTransfer as a LinkTokenReceiver. Upon execution of this function, the oracle contract emits an OracleRequest event containing information about the request. This event is crucial, as it is monitored by the off-chain oracle node which acts upon it.


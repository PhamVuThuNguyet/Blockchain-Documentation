# What is Hyperledger?

- “Hyperledger is an open sourced community of communities to benefit an ecosystem of Hyperledger based solution providers and users focused on blockchain related use cases that will work across a variety of industrial sectors.“ – Theo Brian Behlendorf, Giám đốc điều hành của Hyperledger.

- Hyperledger là một dự án mã nguồn mở, nó xây dựng một hệ sinh thái các giải pháp và người dùng trên nền tảng công nghệ blockchain nhằm giải quyết các vấn đề trong ngành công nghiệp.

- Hyperledger thuộc tổ chức Linux Foundation.
  Tư tưởng của Hyperledger là thế giới sẽ gồm nhiều kênh thanh toán (private chain) riêng biệt với các thị trường khác nhau. Mỗi doanh nghiệp có những đặc trưng riêng, nên các ứng dụng cho các doanh nghiệp sẽ cần phát triển với các quy tắc được cá nhân hóa. Không giống như ethereum có xu hướng buộc các nhà phát triển xây dựng các ứng dụng của họ xung quanh một bộ giao thức định sẵn.

# How Does It Work?

- Trên mạng Hyperledger, các peer liên kết trực tiếp với nhau và chỉ có sổ cái của riêng họ được cập nhật về thỏa thuận giao dịch. Các bên giúp thực hiện giao dịch chỉ được biết một lượng thông tin đủ để họ cần để chuyển tiếp và cho phép giao dịch trên mạng.

- Tất cả điều này được thực hiện nhờ kiến ​​trúc mô đun của Hyperledger, nó làm cho các cơ chế như thuật toán đồng thuật trở thành một tính năng có thể tùy biến (plug-and-play). Trong kiến ​​trúc này, những đăc điểm đáng chú ý nhất được thể hiện trong các peer của mạng. Các peer đã được chia thành ba vai trò riêng biệt, đó là:

  - Endorser: Các endorser là những peer thực thi các giao dịch trong chaincode container và đề xuất giao dịch lên mạng dựa trên kết quả của hợp đồng thông minh. Tất cả các endoser peer phải được cài đặt chaincode.

  - Committer: Đây là những peer không nhất thiết phải cài đặt chaincode, chúng lưu trữ sổ cái đầy đủ (full ledger). Sự khác biệt chính giữa committer peer và endoser peer là việc committer peer không thể gọi chaincode hoặc chạy các hàm trong hợp đồng thông minh.

  - Consenters: Các nút này chịu trách nhiệm điều hành sự đồng thuận của mạng. Consenters có trách nhiệm xác nhận các giao dịch và quyết định các giao dịch sẽ được đưa vào sổ cái.

# Hyperleger Fabric

## What is Hyperledger Fabric?

Hyperedger Fabric là một trong 5 Framework về Blockchain nằm trong chiến lược Hyperledger Umbrella của Linux Foundation gồm : Hyperledger Indy, Hyperledger Fabric, Hyperledger Iroha, Hyperledger Sawtooth, Hyperledger Burror. Điều đặc biệt là Hyperledger Fabric được contributed bởi ông lớn IBM.

Hyperledger Fabric được xem là có tính mô đun tương đối cao. Hơn nữa Hyperledger Fabric hoạt động khá linh hoạt và nó còn cung cấp cho doanh nghiệp một bộ khung để xây dựng Private Blockchain. Đó là lý do tại sao các doanh nghiệp có thể dễ dàng xây dựng một ứng dụng Private Blockchain phù hợp các yêu cầu nghiệp vụ của mình.

## Hyperledger Fabric Architechture & Components

Một mạng Hyperledger Fabric bao gồm nhiều tổ chức tương tác lẫn nhau. Mỗi tổ chức được định nghĩa bởi chứng chỉ gốc (root cert) dành riêng cho tổ chức đó và được lưu trên Fabric Certificate Authority. Các user và thành phần khác của tổ chức được định danh bằng chứng chỉ dựa trên chứng chỉ gốc này. Các chứng chỉ này cũng chỉ định các quyền cho từng đối tượng trên mạng (read-only, full access,...).

![alt](../imgs/hyperledger%20fabric%20architecture.png "Hyperledger Fabric Architecture")

- Assets: Asset là đại diện số cho một đối tượng nào đó trong thế giới thực. Asset được biểu diễn trong Hyperledger Fabric dưới dạng cặp key-value. Trạng thái của asset có thể thay đổi bằng chaincode. Các trạng thái của assets khi thay đổi đều được ghi lại dưới dạng transaction. Asset có thể được biểu diễn dưới dạng nhị phân hoặc JSON.

- Chaincode: Chaincode là phần mềm định nghĩa asset và transaction instructions for modifying assets. Chaincode enforces the rules for reading or altering key-value pairs or other state database information. Các hàm chaincode thực thi dựa trên state db hiện tại của ledger và được khởi tạo thông qua một đề xuất giao dịch. Kết quả thực thi của chaincode là một set các lần ghi key-value, được gửi lên network và lưu vào ledger trên tất cả các peer.

- Ledger: Ledger lưu các state transition, là kết quả của các lệnh gọi chaincode do các peer gửi. Một ledger có 2 phần là "Transaction Log" và "State Database". Default: LevelDB. Transaction Log is immutable. There is only one ledger per channel. Each peer maintains a copy of the ledger for each channel of which they are a member. The copy of the ledger kept by the ordering service does not contain a state database.

- Policies: Policies typically describe a who and a what, such as the access or rights that an individual has over an asset. Policies are one of the things that make Hyperledger Fabric different from other blockchains like Ethereum or Bitcoin. Because Fabric is a permissioned blockchain whose users are recognized by the underlying infrastructure, those users have the ability to decide on the governance of the network before it is launched, and change the governance of a running network.

- Nodes:

  - Orderers: Communication channel for fabric. Nếu như trong Public Blockchain, tất cả các node của mạng đều tham gia vào quá trình đồng thuận, thì ở Hyperledger Fabric chỉ có Orderer tham gia vào quá trình đó. Implemented with Message Oriented Middleware (Default: SOLO).
  - Peers: Maintain its own copy of ledger.
    - Lead peers: Receive blocks from orderers. May be either statically or dynamically assigned.
    - Anchor peers: They are known outside Organization. They are the only peer instances within an organization that are discoverable. Each organization must have at least one anchor peer.
  - Clients: Act on behalf of end users. They create transaction requests and submit to the network.

- Channels:
  - Transactions isolated within the channel. In other words, transactions created on one channel are available only to the members of that channel.
  - Each channel has its own distributed ledger.
  - Chaincode deployed to a channel, not to the network.
  - Bootstrap channel is automatically created at the time of the network initialization.
  - Organizations or peers can join multi channels.

## How Fabric Networks are Structured?

### Creating the Network

The first step in creating a network or a channel is to agree to and then define its configuration. A block known as a “configuration block” that is, typically, created by the configtxgen tool from a configtx.yaml file.

This configuration block contains a record of the organizations that can join components and interact on the channel, as well as the policies that define the structure for how decisions are made and specific outcomes are reached.

The definitions of these organizations, and the identities of their admins, must be created by a Certificate Authority (CA) associated with each organization. The mapping of certificates to member organizations is achieved via a structure called a Membership Services Provider (MSP), which defines an organization by creating an MSP which is tied to a root CA certificate to identify that components and identities were created by the root CA.

### Install, Approve, and Commit a Chaincode

Chaincodes are installed on peers, and then defined and committed on a channel. The ordering service does not have the chaincode installed on it, as ordering nodes do not typically propose transactions. The process of installing, approving, and committing a chaincode is known as the “lifecycle” of the chaincode.

The most important piece of information supplied within the chaincode definition is the endorsement policy. It describes which organizations must endorse transactions before they will be accepted by other organizations onto their copy of the ledger.

### Using an Application on the Channel

After a smart contract has been committed, client applications can be used to invoke transactions on a chaincode, via the Fabric Gateway service (the gateway). Just like peers and orderers, a client application has an identity that associates it with an organization.

# Key Concepts of Hyperledger Fabric

## Smart Contracts and Chaincode

### Smart Contract vs Chaincode

In general, a smart contract defines the transaction logic that controls the lifecycle of a business object contained in the world state. It is then packaged into a chaincode which is then deployed to a blockchain network. Think of smart contracts as governing transactions, whereas chaincode governs how smart contracts are packaged for deployment.

A smart contract is defined within a chaincode. Multiple smart contracts can be defined within the same chaincode. When a chaincode is deployed, all smart contracts within it are made available to applications.

![alt](../imgs/smartcontract.diagram.02.png "Chaincode and Smart Contracts")

### Ledger
A smart contract programmatically accesses two distinct pieces of the ledger – a blockchain, which immutably records the history of all transactions, and a world state that holds a cache of the current value of these states, as it’s the current value of an object that is usually required.

### Endorsement
Associated with every chaincode is an endorsement policy that applies to all of the smart contracts defined within it. This endorsement policy identifies which organizations must approve transactions generated by the smart contract before those transactions can be identified as valid. All transactions, whether valid or invalid are added to a distributed ledger, but only valid transactions update the world state.

Endorsement policies are what make Hyperledger Fabric different to other blockchains like Ethereum or Bitcoin. In these systems valid transactions can be generated by any node in the network. Hyperledger Fabric more realistically models the real world; transactions must be validated by trusted organizations in a network.

### Valid Transactions
When a smart contract executes, it runs on a peer node owned by an organization in the blockchain network. All transactions have an identifier, a proposal -  a set of input parameters, and a response - a read-write set that will changes the world state, signed by a set of organizations.

![alt](../imgs/smartcontract.diagram.04.png "Valid Transactions")

A transaction that is distributed to all peer nodes in the network is validated in two phases by each peer. Firstly, the transaction is checked to ensure it has been signed by sufficient organizations according to the endorsement policy. Secondly, it is checked to ensure that the current value of the world state matches the read set of the transaction when it was signed by the endorsing peer nodes; that there has been no intermediate update. If a transaction passes both these tests, it is marked as valid.

### Intercommunication
A Smart Contract can call other smart contracts both within the same channel and across different channels.

### System chaincode
A chaincode can also define low-level program code which corresponds to domain independent system interactions.
- _lifecycle: runs in all peers and manages the installation of chaincode on peers, the approval of chaincode definitions for organization, and the committing of chaincode definitions to channels. 
- Lifecycle System Chaincode (LSCC): manages the chaincode lifecycle
- Configuration System Chaincode (CSCC):  runs in all peers to handle changes to a channel configuration, such as a policy update. 
- Query System Chaincode (QSCC): runs in all peers to provide ledger APIs which include block query, transaction query etc.
- Endorsement System Chaincode (ESCC): runs in endorsing peers to cryptographically sign a transaction response. 
- Validation System Chaincode (VSCC): validates a transaction, including checking endorsement policy and read-write set versioning.

## Fabric Chaincode Lifecycle

### What is Chaincode?

Chaincode is a program, written in Go, Node.js, or Java that implements a prescribed interface. Chaincode runs in a secured Docker container isolated from the endorsing peer process. Chaincode initializes and manages ledger state through transactions submitted by applications.

Ledger updates created by a chaincode are scoped exclusively to that chaincode and can’t be accessed directly by another chaincode. However, within the same network, given the appropriate permission a chaincode may invoke another chaincode to access its state.

### Chaincode Lifecycle

The Fabric chaincode lifecycle is a process that allows multiple organizations to agree on how a chaincode will be operated before it can be used on a channel.

#### Install and Define a Chaincode

Fabric chaincode lifecycle requires that organizations agree to the parameters that define a chaincode, such as name, version, and the chaincode endorsement policy. Channel members come to agreement using the following four steps. Not every organization on a channel needs to complete each step.

1. Package the chaincode: Chaincode cần được đóng gói thành file tar trước khi cài đặt lên peer. Khi đóng gói chaincode, cần tạo package label để người khác có thể đọc hiểu về mô tả của chaincode. The tar file needs to contain two files (no directory): a metadata file “metadata.json” and another tar “code.tar.gz” containing the chaincode files. “metadata.json” contains JSON that specifies the chaincode language, code path, and package label (For example: {"Path":"fabric-samples/asset-transfer-basic/chaincode-go","Type":"golang","Label":"basicv1"})
2. Install the chaincode on peers: Cần cài đặt chaincode trên tất cả peer nào sẽ thực thi và xác nhận transactions. A successful install command will return a chaincode package identifier, which is the package label combined with a hash of the package. This package identifier is used to associate a chaincode package installed on your peers with a chaincode definition approved by your organization.
3. Approve a chaincode definition for organization: Một chaincode được quản lý bằng chaincode definition. Chaincode definition bao gồm các tham số sau, cần phải nhất quán giữa các tổ chức:

- Name: Các ứng dụng gọi chaincode thông qua tên này
- Version: Phiên bản của chaincode package. Nếu upgrade binaries của chaincode thì version này cũng thay đổi theo. Format thường dùng: v1.2.3.
- Sequence: Số lần chaincode đã được define trên 1 channel, dùng để quản lý những lần nâng cấp của chaincode. For example, when you first approve and commit a chaincode definition on a channel, the sequence number must be set to 1. When you next upgrade the chaincode or update the chaincode definition, increment the sequence number to 2. Tham số sequence này được dùng bởi các peer để đảm bảo tất cả các org luôn đồng bộ về chaincode definitions.
- Endorsement Policy: Chính sách chứng thực quy định tổ chức nào cần thực thi và xác thực kết quả giao dịch. Nó có thể được thể hiện dưới dạng chuỗi truyền vào cli hoặc là tham chiếu của 1 chính sách trong cấu hình của kênh.
- Collection Configuration: The path to a private data collection definition file associated with your chaincode.
- ESCC / VSCC Plugins: Tên của một plugin xác thực hoặc chứng thực tùy chỉnh sẽ được sử dụng bởi chaincode này.
- Initialization

4. Commit the chaincode definition to the channel

# Working with Hyperledger Fabric

## Install Fabric

- `curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh` (lấy install scripts)

- `./install-fabric.sh docker samples` (install fabric images & clone fabric samples)

- `curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/bootstrap.sh` (get bootstrap scripts to install binaries)

## Using the Test Network

- `./network.sh up`
- `./network.sh down`
- `./network.sh createChannel -c channelname`
  NOTE: Make sure the name of the channel applies the following restrictions:

  - contains only lower case ASCII alphanumerics, dots ‘.’, and dashes ‘-‘
  - is shorter than 250 characters
  - starts with a letter

- `./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-javascript -ccl javascript -c channelname`
  NOTE: If error `sudo apt-get install -y jq`

- `export PATH=${PWD}/../bin:$PATH` (add binaries to your CLI Path)
- `export FABRIC_CFG_PATH=$PWD/../config/` ( set the FABRIC_CFG_PATH to point to the core.yaml file in the fabric-samples repository)
- `export CORE_PEER_TLS_ENABLED=true`
  `export CORE_PEER_LOCALMSPID="Org1MSP"`
  `export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt`
  `export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp`
  `export CORE_PEER_ADDRESS=localhost:7051` ( set the environment variables that allow you to operate the peer CLI as Org1. The CORE_PEER_TLS_ROOTCERT_FILE and CORE_PEER_MSPCONFIGPATH environment variables point to the Org1 crypto material in the organizations folder.)

- `peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C testchannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'` (initialize the ledger with assets)

- `peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'` (query the ledger from your CLI)

- `peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C testchannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"TransferAsset","Args":["asset6","Christopher"]}'` (change the owner of an asset on the ledger by invoking the asset-transfer (basic) chaincode.
  Because the endorsement policy for the asset-transfer (basic) chaincode requires the transaction to be signed by Org1 and Org2, the chaincode invoke command needs to target both peer0.org1.example.com and peer0.org2.example.com using the --peerAddresses flag. Because TLS is enabled for the network, the command also needs to reference the TLS certificate for each peer using the --tlsRootCertFiles flag.)

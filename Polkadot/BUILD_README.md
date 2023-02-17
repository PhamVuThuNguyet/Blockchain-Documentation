# Prerequisites

- Install WSL, Ubuntu
- Install require packages and rust:

  - Add the required packages for the Ubuntu distribution

    `sudo apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler`

  - Download the rustup installation program and use it to install Rust for the Ubuntu distribution

    `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

  - Update your current shell to include Cargo
    `source ~/.cargo/env`

  - Configure the Rust toolchain to use the latest stable version as the default toolchain

    ```
    rustup default stable
    rustup update
    ```

  - Add the nightly version of the toolchain and the nightly WebAssembly (wasm) target to your development environment

    ```
    rustup update nightly
    rustup target add wasm32-unknown-unknown --toolchain nightly
    ```

# Prepare for smart contract develop

- Update Rust env

  `rustup component add rust-src`

- Verify that you have the WebAssembly target installed

  `rustup target add wasm32-unknown-unknown --toolchain nightly`

- Install cargo-contract CLI tool:

  Cargo-contract is a command-line tool which you will use to build, deploy, and interact with your ink! contracts.

  `cargo install --force --locked cargo-contract --version 2.0.0-rc`

- Install the Substrate Contracts Node:

  `cargo install contracts-node --git https://github.com/paritytech/substrate-contracts-node.git --tag <latest-tag> --force --locked`

# Ink!

## Create an Ink! project

- New project

  `cargo contract new <name>`

- Test contract

  `cargo test`

## Compile smart contract

`cargo contract build`

`cargo contract build --release`

## Run a substrate node

`substrate-contracts-node`

(https://contracts-ui.substrate.io/)

## Ink! basic

### Contract template

- In lib.rs:
  - Exactly one #[ink(storage)] struct.
  - At least one #[ink(constructor)] function.
  - At least one #[ink(message)] function (public function).

### Storing values

- Substrate contracts may store types that are encodable and decodable with <a href = "https://github.com/paritytech/parity-scale-codec"> Parity SCALE codec </a>, which includes common data types: `bool`, `u{8,16,32,64,128}`, `i{8,16,32,64,128}`, `String`, `tuples`, and `arrays`.

- Ink! provides specific types: `AccountId`, `Balance`, `Hash`, and `Mapping`

- `enum` can be used as a datatype in `struct`

- use ```Some()``` if variable is ```Option<>```

### Environment Functions

- In an `#[ink(constructor)]` use `Self::env()` to access those, in an `#[ink(message)]` use `self.env()`. Read more at <a href = "https://docs.rs/ink_env/4.0.0/ink_env/#functions"> here </a>
  - caller(): Returns the address of the caller of the executed contract.
  - account_id(): Returns the account ID of the executed contract.
  - balance(): Returns the balance of the executed contract.
  - block_number(): Returns the current block number.
  - emit_event(…): Emits an event with the given event data.
  - transfer(…): Transfers value from the contract to the destination account ID.
  - hash_bytes(…): Conducts the crypto hash of the given input and stores the result in output.

### Events

- In a constructor, emit through `Self::env().emit_event()`. In a message, events are emitted via `self.env().emit_event()`:

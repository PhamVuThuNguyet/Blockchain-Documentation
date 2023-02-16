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

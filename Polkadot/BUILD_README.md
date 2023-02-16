# Prerequisites

- Install WSL, Ubuntu
- Install require packages and rust:
    - Add the required packages for the Ubuntu distribution

        ```sudo apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler```

    - Download the rustup installation program and use it to install Rust for the Ubuntu distribution 
    
        ```curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh```
    
    - Update your current shell to include Cargo
        ```source ~/.cargo/env```

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
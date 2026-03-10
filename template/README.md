# rustyjupyter

Nix flake template for a Jupyter Lab environment with a Rust kernel ([evcxr](https://github.com/evcxr/evcxr)).

## Prerequisites

- [Nix](https://nixos.org/) with flakes enabled
- Rust toolchain (`rustc`, `cargo`) already installed on your system (e.g. via [rustup](https://rustup.rs/))

## Usage

```sh
mkdir my-project && cd my-project
nix flake init -t github:encodepanda/rustyjupyter
nix develop
jupyter lab
```

Select the **Rust (evcxr)** kernel when creating a new notebook.

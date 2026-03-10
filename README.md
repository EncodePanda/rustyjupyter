# rustyjupyter

Nix flake template for a Jupyter Lab environment with a Rust kernel.

## Usage

```sh
mkdir my-project && cd my-project
nix flake init -t github:encodepanda/rustyjupyter
nix develop
jupyter lab
```

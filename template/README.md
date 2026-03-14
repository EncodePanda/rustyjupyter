# rustyjupyter

Nix flake for a Jupyter Lab environment with a Rust kernel ([evcxr](https://github.com/evcxr/evcxr)).

## Prerequisites

- [Nix](https://nixos.org/) installed with flakes enabled
- Rust toolchain (`rustc`, `cargo`) installed (e.g. via [rustup](https://rustup.rs/))

## Usage

```sh
mkdir my-project && cd my-project
nix flake init -t github:encodepanda/rustyjupyter
nix develop
jupyter lab
```

Select the **Rust (evcxr)** kernel when creating a new notebook or open an
existing notebook that comes with the template `rust-examples.ipynb`

## Slides export

Export a notebook to reveal.js slides:

```sh
./mkslides notebook.ipynb           # uses default "sky" theme
./mkslides notebook.ipynb dark      # uses "dark" theme
```

This produces `notebook.slides.html` which you can open in a browser.

### Line highlighting in slides

You can highlight specific lines of code in exported slides. Use the `highlight`
script to manage which lines are highlighted:

```sh
./highlight notebook.ipynb           # list all code cells with line numbers
./highlight notebook.ipynb 2         # show just code cell #2
./highlight notebook.ipynb 2 1,3-5,8 # highlight lines 1, 3, 4, 5, 8 in code cell #2
./highlight notebook.ipynb 2 clear   # remove highlighting from code cell #2
```

Then re-export with `./mkslides notebook.ipynb`. The highlighted lines will have
a yellow background in the slides.

Cell indices are 0-based and count only code cells (markdown cells are
skipped). Line numbers are 1-based. Ranges like `3-5` expand to `3, 4, 5`.

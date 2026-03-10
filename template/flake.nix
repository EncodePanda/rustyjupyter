{
  description = "Jupyter Lab with Rust (evcxr) kernel for AI/ML/plotting notebooks";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        pythonEnv = pkgs.python312.withPackages (ps: with ps; [
          jupyterlab
          ipykernel
          plotly
          numpy
          pandas
          matplotlib
        ]);

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pythonEnv
          ];

          shellHook = ''
            export JUPYTER_PATH="$PWD/.jupyter"

            # Install evcxr_jupyter using the global Rust toolchain if not already installed
            if ! command -v evcxr_jupyter &> /dev/null; then
              echo "evcxr_jupyter not found. Installing via cargo..."
              cargo install --locked evcxr_jupyter
            fi

            # Register the Rust kernel for Jupyter if not already present
            if [ ! -f ".jupyter/kernels/rust/kernel.json" ]; then
              echo "Registering Rust (evcxr) kernel for Jupyter..."
              mkdir -p .jupyter/kernels/rust
              cat > .jupyter/kernels/rust/kernel.json << 'EOF'
            {
              "argv": ["evcxr_jupyter", "--control_file", "{connection_file}"],
              "display_name": "Rust (evcxr)",
              "language": "rust"
            }
            EOF
              echo "Rust kernel registered."
            fi

            echo ""
            echo "  Jupyter Lab with Rust Kernel ready."
            echo "  Run: jupyter lab"
            echo ""
          '';
        };
      }
    );
}

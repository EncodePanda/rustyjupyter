{
  description = "Nix flake template: Jupyter Lab with Rust (evcxr) kernel";

  outputs = { self, ... }: {
    templates.default = {
      path = ./template;
      description = "Jupyter Lab with Rust (evcxr) kernel for AI/ML/plotting notebooks";
    };
  };
}

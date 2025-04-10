# /nixvim/flake.nix
# Thank you for the config, Wyatt

{
  description = "Spebby's Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      nixvim,
      nixpkgs,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          pkgs = import nixpkgs { inherit system; };

          bundledModule = {
            module = {
              extraPackages = with pkgs; [
                # Rust
                cargo
                rustc
                rustfmt
                rust-analyzer
                clippy

                # Python
                ruff
                mypy

                # Bash
                shellcheck
                shfmt

                # C
                clang-tools

                # C# / .NET
                dotnetCorePackages.dotnet_8.sdk
                omnisharp-roslyn
                #msbuild # Depends on insecure dotnet version (6)
                mono # Unity

                # JS/TS
                nodejs
                nodePackages.typescript
                nodePackages.eslint

                # Nix
                statix
                nixfmt-rfc-style

                # Markdown
                markdownlint-cli
                nodePackages.prettier

                # Misc
                yazi
                wakatime-cli
              ];
              imports = [ ./plugins ];
            };
          };

          minimalModule = {
            module.imports = [ ./plugins ];
          };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule minimalModule;
          };

          packages = {
            default = nixvim'.makeNixvimWithModule bundledModule;
            nvim-minimal = nixvim'.makeNixvimWithModule minimalModule;
          };

          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; [
                pre-commit
                nixfmt-rfc-style
                statix
              ];
              shellHook = ''
                pre-commit install
              '';
            };
          };
        };
    };
}

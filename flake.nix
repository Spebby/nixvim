# /nixvim/flake.nix
# Thank you for the config, Wyatt
{
  description = "Spebby's Nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixvim,
      nixpkgs,
      flake-parts,
      pre-commit-hooks,
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
          #nixvimLib = nixvim.lib.${system};
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

                # Zig
                zig

                # Misc
                yazi
                wakatime-cli

                # LaTeX
                texlab
                tex-fmt
                texlivePackages.chktex
              ];
              imports = [ ./config ];
            };
          };
          minimalModule = {
            module.imports = [ ./config ];
          };
        in
        {
          checks = {
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              excludes = [
                ".*/submodules/.*"
                "^submodules/.*"
              ];
              hooks = {
                flake-checker.enable = true;
                nixfmt-rfc-style = {
                  enable = true;
                  settings.width = 100;
                };
                statix = {
                  enable = true;
                  settings.ignore = [ "flake.lock" ];
                };
                deadnix.enable = true;
                nil.enable = true;
                shellcheck.enable = true;
                shfmt.enable = true;
                typos.enable = true;
              };
            };
          };
          packages = {
            default = nixvim'.makeNixvimWithModule bundledModule;
            nvim-minimal = nixvim'.makeNixvimWithModule minimalModule;
          };
          devShells = {
            default = pkgs.mkShell {
              shellHook = ''
                ${self.checks.${system}.pre-commit-check.shellHook}
              '';
            };
          };
        };
    };
}

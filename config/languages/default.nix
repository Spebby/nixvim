{ pkgs, ... }:
{
  imports = [
    ./python.nix
    ./rust.nix
    ./c.nix
    ./bash.nix
    ./nix.nix
    ./latex.nix
    ./markdown.nix
    ./sql.nix
    ./yaml.nix
    ./terraform.nix
    ./javascript.nix
    ./json.nix
    ./csharp.nix
  ];

  plugins.treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        cpp
        markdown
        markdown_inline
        latex
        python
        bash
        nix
        rust
        toml
        yaml
        json
        json5
        javascript
        typescript
        tsx
        c_sharp
        terraform
        hcl
        vim
        vimdoc
        query
        regex
      ];
    };
  };
}

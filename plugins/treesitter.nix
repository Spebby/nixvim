{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        markdown
        markdown_inline
        latex
        python
        bash
        nix
        vim
        vimdoc
        query
        rust
        toml
        regex
      ];
    };
  };
}

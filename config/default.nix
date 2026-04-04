{
  imports = [
    ./languages
    ./git
  ]
  ++ [
    ./options.nix
    ./keymaps.nix
    ./fzf.nix
    ./lsp.nix
    ./cmp.nix
    ./lint.nix
    ./format.nix
    ./lualine.nix
    ./autocmd.nix
    ./yazi.nix
  ];

  colorschemes.onedark = {
    enable = true;
    settings.style = "warmer";
  };

  plugins = {
    wakatime.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
    colorizer.enable = true;
    vim-surround.enable = true;
  };
}

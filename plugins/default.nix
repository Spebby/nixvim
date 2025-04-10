{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./telescope.nix
    ./lsp.nix
    ./cmp.nix
    ./treesitter.nix
    ./lint.nix
    ./format.nix
    ./gitsigns.nix
    ./lualine.nix
    ./fugitive.nix
    ./autocmd.nix
  ];

  colorschemes.onedark = {
    enable = true;
    settings.style = "warmer";
  };

  plugins = {
    wakatime.enable = true;
    yazi.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
    colorizer.enable = true;
    vim-surround.enable = true;
  };
}

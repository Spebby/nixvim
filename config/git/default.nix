{
  imports = [
    ./fugitive.nix
    ./gitsigns.nix
    ./fzf.nix
    ./neogit.nix
  ];

  plugins.diffview.enable = true;
}

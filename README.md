# Credits

Based heavily on my good friend wyatt's
[config](https://github.com/wyatt-avilla/nixvim). Modified to suit my own taste
and needs.

## Flake Outputs

This flake exposes 2 versions of my NixVim config, one bundled with dependencies
(`fzf`, `yazi`), and one without.

Run either like so:

```
# Include all dependencies (default behaviour)
nix run github:Spebby/nixvim

# Only Neovim
nix run github:Spebby/nixvim#nvim-minimal
```

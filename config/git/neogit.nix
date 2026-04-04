{
  plugins.neogit = {
    enable = true;
    settings = {
      mappings = {
        popup = {
          i = false;
        };
        status = {
          "=" = "Toggle";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
      mode = "n";
      options.desc = "Open Neogit";
    }
    {
      key = "<leader>gp";
      action = "<cmd>Neogit pull<CR>";
      mode = "n";
      options.desc = "Git pull";
    }
    {
      key = "<leader>gP";
      action = "<cmd>Neogit push<CR>";
      mode = "n";
      options.desc = "Git push";
    }
  ];

  autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "NeogitStatus" ];
      command = "lua vim.keymap.set('n', 'i', 'k', { buffer = true, silent = true })";
    }
  ];
}

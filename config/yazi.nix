{
  plugins.yazi = {
    enable = true;
    settings = {
      open_for_directories = true;
    };
    luaConfig.post = ''
      vim.g.loaded_netrwPlugin = 1
    '';
  };

  keymaps = [
    {
      key = "<leader>lf";
      action = "<cmd>Yazi<CR>";
      mode = "n";
      options.desc = "Open Yazi";
    }
  ];
}

{
  keymaps = [
    {
      key = "<leader>we";
      action = "<cmd>wincmd w<CR>";
      mode = "n";
      options.desc = "Cycle next window";
    }
    {
      key = "<leader>wi";
      action = "<cmd>wincmd W<CR>";
      mode = "n";
      options.desc = "Cycle previous window";
    }
    {
      key = "<leader>be";
      action = "<cmd>bnext<CR>";
      mode = "n";
      options.desc = "Cycle next buffer";
    }
    {
      key = "<leader>bi";
      action = "<cmd>bprevious<CR>";
      mode = "n";
      options.desc = "Cycle previous buffer";
    }
  ];
}

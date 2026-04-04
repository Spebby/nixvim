{
  plugins = {
    fzf-lua = {
      keymaps = {
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Git commits";
        };

        "<leader>gs" = {
          action = "git_status";
          options.desc = "Git status";
        };

        "<leader>gb" = {
          action = "git_branches";
          options.desc = "Git branches";
        };

        "<leader>bl" = {
          action = "git_bcommits";
          options.desc = "Git commits in current buffer";
        };
      };
    };
  };
}

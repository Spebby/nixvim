{
  plugins = {
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };

        "<leader>lg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };

        "<leader>gs" = {
          action = "grep_string";
          options.desc = "Grep string";
        };

        "<leader>lb" = {
          action = "buffers";
          options.desc = "Buffer browser";
        };
      };

      settings.defaults.mappings.n = {
        "e" = "move_selection_next";
        "i" = "move_selection_previous";
      };

      settings.pickers.buffers = {
        initial_mode = "normal";
        mappings.n = {
          "x" = "delete_buffer";
        };
      };
    };
  };
}

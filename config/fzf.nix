{
  autoCmd = [
    {
      event = [ "VimEnter" ];
      command = "FzfLua register_ui_select";
    }
  ];

  plugins = {
    fzf-lua = {
      enable = true;
      settings.keymap.fzf.__raw = ''
        {
          ["ctrl-u"] = "preview-up",
          ["ctrl-d"] = "preview-down",
        }
      '';
      settings.keymap.builtin.__raw = ''
        {
          ["<C-u>"] = "preview-up",
          ["<C-d>"] = "preview-down",
        }
      '';
      keymaps = {
        "<leader>ff" = {
          action = "files";
          options.desc = "Find files";
        };

        "<leader>lg" = {
          action = "grep_project";
          options.desc = "Grep fuzzily";
        };

        "<leader>ge" = {
          action = "live_grep";
          options.desc = "Grep exact string";
        };

        "<leader>lb" = {
          action = "buffers";
          options.desc = "Buffer browser";
        };

        "<leader>ch" = {
          action = "command_history";
          options.desc = "Command history";
        };

        "<leader>ca" = {
          action = "lsp_code_actions";
          options.desc = "Code action preview";
        };

        "<leader>dc" = {
          action = "lsp_document_diagnostics";
          options.desc = "Diagnostics for current buffer";
        };

        "<leader>dw" = {
          action = "lsp_workspace_diagnostics";
          options.desc = "Diagnostics for workspace";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>gv";
      action = "<cmd>Fzf grep_visual<CR>";
      mode = "v";
    }
  ];
}

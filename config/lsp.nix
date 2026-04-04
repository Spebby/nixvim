{ lib, ... }:
{
  diagnostic.settings = {
    virtual_text = false;
    virtual_lines = false;
    float.source = "always";
    signs = {
      text = lib.nixvim.toRawKeys {
        "vim.diagnostic.severity.ERROR" = "󰅙";
        "vim.diagnostic.severity.WARN" = "";
        "vim.diagnostic.severity.INFO" = "󰋼";
        "vim.diagnostic.severity.HINT" = "󰌵";
      };
    };
  };

  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls.enable = true;
    };

    keymaps = {
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Goto Definition";
        };
        gr = {
          action = "references";
          desc = "Goto References";
        };
        gD = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        gI = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        gT = {
          action = "type_definition";
          desc = "Type Definition";
        };
        K = {
          action = "hover";
          desc = "Hover";
        };
        "<leader>cw" = {
          action = "workspace_symbol";
          desc = "Workspace Symbol";
        };
        "<leader>rn" = {
          action = "rename";
          desc = "Rename";
        };
        "<C-k>" = {
          action = "signature_help";
          desc = "Signature Help";
        };
      };
      diagnostic = {
        "<leader>de" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
        "]d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action.__raw = "function()
    vim.diagnostic.config({ virtual_lines = { current_line = true } })

    ns = vim.api.nvim_create_namespace('toggle_virtual_lines')

    local function disable_virtual_lines()
      vim.diagnostic.config({ virtual_lines = false })
      vim.on_key(nil, ns)
    end

    vim.on_key(disable_virtual_lines, ns)
  end";
      mode = "n";
      options.noremap = true;
      options.desc = "Open virtual lines for the current line";
    }
  ];
}

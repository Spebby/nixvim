{
  diagnostics = {
    float.source = "always";
  };

  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      jedi_language_server.enable = true;
      marksman.enable = true;

      ruff = {
        enable = true;
        extraOptions.init_options.settings = {
          lint = {
            select = [ "ALL" ];
            ignore = [
              "D"
              "CPY"
              "T20"
              "E501"
            ];
          };
        };
      };

      rust_analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;

        settings = {
          checkOnSave = true;
          check = {
            command = "clippy";
            extraArgs = [
              "--"
              "-W"
              "clippy::pedantic"
            ];
          };
        };
      };
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
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Action";
        };
        "<C-k>" = {
          action = "signature_help";
          desc = "Signature Help";
        };
      };
      diagnostic = {
        "<leader>e" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "]d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };
    };
  };
}

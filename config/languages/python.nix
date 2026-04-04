{
  plugins = {
    conform-nvim.settings.formatters_by_ft.python = [ "ruff_format" ];

    lint = {
      lintersByFt.python = [ "mypy" ];
      luaConfig.post = ''
        local lint = require("lint")
        lint.linters.mypy.args = vim.list_extend({"--strict"}, lint.linters.mypy.args)
      '';
    };

    lsp.servers = {
      jedi_language_server.enable = true;

      ruff = {
        enable = true;
        extraOptions.init_options.settings = {
          configurationPreference = "filesystemFirst";
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
    };
  };
}

{
  plugins = {
    conform-nvim.settings.formatters_by_ft.sh = [ "shfmt" ];

    lint = {
      lintersByFt.sh = [ "shellcheck" ];
      luaConfig.post = ''
        local lint = require("lint")
        lint.linters.shellcheck.args = vim.list_extend({"--enable=all"}, lint.linters.shellcheck.args)
      '';
    };

    lsp.servers.bashls.enable = true;
  };
}

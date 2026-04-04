{
  plugins = {
    conform-nvim.settings.formatters_by_ft = {
      json = [ "prettier" ];
      jsonc = [ "prettier" ];
    };

    lint.lintersByFt.json = [ "json5" ];

    lsp.servers.jsonls.enable = true;
  };
}

{
  plugins = {
    conform-nvim.settings.formatters_by_ft = {
      javascript = [ "prettier" ];
      javascriptreact = [ "prettier" ];
      typescript = [ "prettier" ];
      typescriptreact = [ "prettier" ];
    };

    lsp.servers = {
      ts_ls.enable = true;
      eslint.enable = true;
    };
  };
}

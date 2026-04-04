{
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft.markdown = [
        "prettier"
        "markdownlint"
      ];
    };

    lint.lintersByFt.markdown = [ "markdownlint" ];

    lsp.servers.marksman.enable = true;
  };
}

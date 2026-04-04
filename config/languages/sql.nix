{
  plugins = {
    conform-nvim.settings.formatters_by_ft.sql = [ "sqlfluff" ];

    lint.lintersByFt.sql = [ "sqlfluff" ];

    lsp.servers.sqls = {
      enable = true;

      cmd = [
        "sqls"
        "--config"
        ".sqls.yml"
      ];
    };
  };
}

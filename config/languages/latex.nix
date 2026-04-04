{
  plugins = {
    conform-nvim.settings.formatters_by_ft.tex = [ "tex-fmt" ];

    lsp.servers.texlab = {
      enable = true;

      settings.texlab.chktex = {
        onOpenAndSave = true;
        additionalArgs = [ "-n8" ];
      };
    };
  };
}

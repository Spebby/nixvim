{
  plugins = {
    conform-nvim.settings.formatters_by_ft.rust = [ "rustfmt" ];

    lsp.servers.rust_analyzer = {
      enable = true;
      installRustc = false;
      installCargo = false;
      package = null;

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
}

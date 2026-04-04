{
  plugins = {
    conform-nvim.settings.formatters_by_ft = {
      terraform = [ "terraform_fmt" ];
      tf = [ "terraform_fmt" ];
    };

    lsp.servers = {
      terraformls.enable = true;

      tflint.enable = true;
    };
  };
}

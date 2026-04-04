{
  plugins = {
    conform-nvim.settings.formatters_by_ft = {
      c = [ "clang_format" ];
      cpp = [ "clang_format" ];
    };

    lint = {
      lintersByFt = {
        c = [ "clangtidy" ];
        cpp = [ "clangtidy" ];
      };
      luaConfig.post = ''
        local lint = require("lint")
        lint.linters.clangtidy.args = vim.list_extend({"-checks='*,-fuchsia-*,-google-*,-android-*,-llvm-header-guard'"}, lint.linters.clangtidy.args)
      '';
    };

    lsp.servers.clangd.enable = true;
  };
}

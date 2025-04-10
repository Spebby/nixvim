{
  plugins.lint = {
    enable = true;
    autoLoad = true;

    lintersByFt = {
      python = [ "mypy" ];
      sh = [ "shellcheck" ];
      c = [ "clangtidy" ];
      cpp = [ "clangtidy" ];
      nix = [ "statix" ];
      markdown = [ "markdownlint" ];
    };

    luaConfig.post = ''
      local lint = require("lint")

      lint.linters.shellcheck.args = vim.list_extend({"--enable=all"}, lint.linters.shellcheck.args)
      lint.linters.mypy.args = vim.list_extend({"--strict"}, lint.linters.mypy.args)
      lint.linters.clangtidy.args = vim.list_extend({"-checks='*,-fuchsia-*,-google-*,-android-*,-llvm-header-guard'"}, lint.linters.clangtidy.args)
    '';
  };
}

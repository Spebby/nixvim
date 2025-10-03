{
  plugins.conform-nvim = {
    enable = true;
    autoLoad = true;

    settings = {
      format_on_save = ''
                function(bufnr)
                  -- Disable with a global or buffer-local variable
                  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                  end
                  return { timeout_ms = 1000, lsp_fallback = false }
                end
        	  '';

      formatters_by_ft = {
        python = [ "ruff_format" ];
        sh = [ "shfmt" ];
        c = [ "clang_format" ];
        cpp = [ "clang_format" ];
        rust = [ "rustfmt" ];
        nix = [ "nixfmt" ];
        markdown = [
          "prettier"
          "markdownlint"
        ];
        yaml = [ "prettier" ];
        tex = [ "tex-fmt" ];
        sql = [ "sqlfluff" ];
      };

      formatters = {
        prettier.prepend_args = [
          "--prose-wrap"
          "always"
        ];

        nixfmt.prepend_args = [ "--strict" ];
      };
    };
  };

  userCommands = {
    FormatDisable = {
      bang = true;
      command.__raw = ''
        function(args)
           if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end
      '';
      desc = "Disable automatic formatting on save";
    };

    FormatEnable = {
      bang = true;
      command.__raw = ''
        function(args)
           if args.bang then
            -- FormatEnable! will enable formatting just for this buffer
            vim.b.disable_autoformat = false
          else
            vim.g.disable_autoformat = false
          end
        end
      '';
      desc = "Enable automatic formatting on save";
    };
  };
}

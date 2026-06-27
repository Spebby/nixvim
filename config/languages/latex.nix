{
  plugins = {
    conform-nvim.settings.formatters_by_ft.tex = [ "tex-fmt" ];

    lsp = {
      servers.texlab = {
        enable = true;

        settings.texlab = {
          chktex = {
            onOpenAndSave = true;
            additionalArgs = [ "-n8" ];
          };

          build = {
            onSave = true;
          };

          forwardSearch = {
            executable = "zathura";
            args = [
              "--synctex-forward"
              "%l:1:%f"
              "%p"
            ];
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tv";
      action.__raw = ''
        function()
          vim.lsp.buf.execute_command({ command = "texlab.forwardSearch" })
        end
      '';
      options.desc = "TexLab Forward Search";
    }
    {
      mode = "n";
      key = "<leader>tb";
      action.__raw = ''
        function()
          vim.lsp.buf.execute_command({ command = "texlab.build" })
        end
      '';
      options.desc = "TexLab Build";
    }
    {
      mode = "n";
      key = "<leader>tc";
      action.__raw = ''
        function()
          vim.lsp.buf.execute_command({ command = "texlab.cleanArtifacts" })
        end
      '';
      options.desc = "TexLab Clean Artifacts";
    }
  ];
}

let
  gs = "require('gitsigns')";

  mkGitSignsAction = action: "<cmd>lua ${gs}.${action}()<CR>";
in
{
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>ghp";
      action = mkGitSignsAction "preview_hunk";
      mode = "n";
      options.desc = "Preview hunk";
    }

    {
      key = "<leader>ghs";
      action = mkGitSignsAction "stage_hunk";
      mode = "n";
      options.desc = "Stage hunk";
    }

    {
      key = "<leader>ghu";
      action = mkGitSignsAction "undo_stage_hunk";
      mode = "n";
      options.desc = "Undo staged hunk";
    }

    {
      key = "<leader>ghr";
      action = mkGitSignsAction "reset_hunk";
      mode = "n";
      options.desc = "Reset hunk";
    }
  ];
}

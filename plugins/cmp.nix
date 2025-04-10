{
  plugins.blink-cmp = {
    enable = true;
    autoLoad = true;

    settings = {
      completion.documentation.auto_show = true;

      keymap = {
        preset = "enter";

        "<Tab>" = [
          "select_next"
          "fallback"
        ];

        "<S-Tab>" = [
          "select_prev"
          "fallback"
        ];

        "<C-u>" = [
          "scroll_documentation_up"
          "fallback"
        ];

        "<C-d>" = [
          "scroll_documentation_down"
          "fallback"
        ];
      };
    };
  };
}

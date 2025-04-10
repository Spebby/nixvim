{
  plugins.fugitive.enable = true;

  autoCmd = [
    {
      command = "noremap <buffer> i k";
      event = [ "Filetype" ];
      pattern = [ "fugitive" ];
    }
  ];
}

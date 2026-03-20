{ ... }: {

  programs.nushell = {
    enable = true;
    settings = {
      buffer_editor = "hx";
      history.max_size = 50;
      show_banner = false;
    };
    shellAliases = {
      la = "ls -a";
      ll = "ls -l";
    };
  };

  catppuccin.nushell = {
    enable = true;
    flavor = "mocha";
  };

}

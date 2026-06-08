{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    settings = {
      buffer_editor = "${pkgs.helix}/bin/hx";
      history.max_size = 50;
      show_banner = false;
    };
    shellAliases = {
      la = "ls -a";
      ll = "ls -l";
    };
  };
}

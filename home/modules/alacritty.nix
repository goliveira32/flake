{ pkgs, ... }:
{

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 2;
          y = 2;
        };
        dynamic_padding = true;
        opacity = 0.8;
      };
      font.size = 14;
      terminal.shell = "${pkgs.nushell}/bin/nu";
      mouse.hide_when_typing = true;
    };
  };

}

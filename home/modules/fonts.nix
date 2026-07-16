{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrains Mono NF" ];
    };
  };
  home.packages = with pkgs; [
    inter
    nerd-fonts.jetbrains-mono
  ];
}

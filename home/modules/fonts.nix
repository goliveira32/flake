{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Inter"
        "Font Awesome 7 Free Solid"
      ];
      monospace = [
        "JetBrains Mono"
        "Font Awesome 7 Free Solid"
      ];
    };
  };
  home.packages = with pkgs; [
    inter
    jetbrains-mono
    font-awesome
  ];
}

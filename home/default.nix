{ pkgs, settings, ... }: {

  imports = [ ./modules ];

  home.stateVersion = settings.homeState;

  home.packages = with pkgs; [
    hyprpicker
    tree
    brightnessctl
    inter
    nerd-fonts.jetbrains-mono
  ];

  home.sessionVariables.LESSHISTFILE = "-"; # Disable less history.

  home.file.".config/wallpaper.png".source = ./assets/wallpaper.png;

}

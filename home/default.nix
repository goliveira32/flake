{ pkgs, meta, ... }:
{

  imports = [ ./modules ];

  home = {
    stateVersion = meta.system.state;
    packages = with pkgs; [
      hyprpicker
      tree
      grim
      slurp
      wl-clipboard-rs
      brightnessctl
      inter
      nerd-fonts.jetbrains-mono
    ];
    sessionVariables.LESSHISTFILE = "-"; # Disable less history.
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    accent = "flamingo";
    flavor = "mocha";
  };

}

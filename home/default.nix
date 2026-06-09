{ pkgs, meta, ... }:

{
  imports = [ ./modules ];

  home = {
    stateVersion = meta.system.state;
    packages = with pkgs; [
      hyprpicker
      tree
      inter
      nerd-fonts.jetbrains-mono
    ];
    preferXdgDirectories = true;
    sessionVariables.LESSHISTFILE = "-"; # Disable `less` history
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    accent = "flamingo";
    flavor = "mocha";
  };
}

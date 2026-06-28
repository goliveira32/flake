{ pkgs, meta, ... }:

{
  imports = [ ./modules ];

  home = {
    stateVersion = meta.system.state;
    packages = with pkgs; [
      jetbrains.idea
      terraform
      hcloud
      hyprpicker
      tree
      inter
      nerd-fonts.jetbrains-mono
    ];
    preferXdgDirectories = true;
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables.LESSHISTFILE = "-"; # Disable `less` history
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    accent = meta.theme.accent;
    flavor = meta.theme.flavor;
  };
}

{ pkgs, meta, ... }:

{
  imports = [ ./modules ];

  home = {
    stateVersion = meta.system.state;
    packages = with pkgs; [
      adwaita-icon-theme # Standard fallback for GNOME icons.
      hcloud
      hicolor-icon-theme # Ultimate fallback for generic icons.
      hyprpicker
      jetbrains.idea
      loupe
      papers
      terraform
      tree
    ];
    preferXdgDirectories = true;
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables.LESSHISTFILE = "-"; # Disable `less` history.
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    accent = meta.theme.accent;
    flavor = meta.theme.flavor;
  };
}

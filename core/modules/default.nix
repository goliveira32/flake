{ ... }:

{
  imports = [
    ./boot.nix
    ./dconf.nix
    ./flatpak.nix
    ./hardware.nix # Generate before installation.
    ./hyprland.nix
    ./hyprlock.nix
    ./i18n.nix
    ./network.nix
    ./udisks2.nix
    ./upower.nix
    ./users.nix
    ./virt-manager.nix
    ./virtualization.nix
  ];
}

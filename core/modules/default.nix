{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix # Generate before installation.
    ./i18n.nix
    ./network.nix
    ./programs
    ./services
    ./users.nix
    ./virtualization.nix
  ];
}

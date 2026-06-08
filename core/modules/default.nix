{ ... }:

{
  imports = [
    ./boot.nix
    ./network.nix
    ./internationalization.nix
    ./users.nix
    ./software.nix
    ./hardware.nix # Generate before installation
  ];
}

{ ... }:
{

  imports = [
    ./boot.nix
    ./network.nix
    ./internationalization.nix
    ./users.nix
    ./software.nix
    ./hardware.nix # Should be generated before installation.
  ];

}

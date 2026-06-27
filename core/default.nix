{ lib, meta, ... }:

{
  imports = [ ./modules ];

  system.stateVersion = meta.system.state;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    lib.elem (lib.getName pkg) [
      "idea"
      "terraform"
    ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}

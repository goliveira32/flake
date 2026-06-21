{ lib, meta, ... }:

{
  imports = [ ./modules ];

  system.stateVersion = meta.system.state;

  nixpkgs.config.allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) [ "idea" ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}

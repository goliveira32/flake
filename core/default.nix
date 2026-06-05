{ meta, ... }:
{

  imports = [ ./modules ];

  system.stateVersion = meta.system.state;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}

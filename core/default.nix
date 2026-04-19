{ settings, ... }:
{

  imports = [ ./modules ];

  system.stateVersion = settings.systemState;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}

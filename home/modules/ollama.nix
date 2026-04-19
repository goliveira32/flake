{ pkgs, unstable, ... }:
{

  services.ollama = {
    enable = true;
    package = unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.ollama;
  };

}

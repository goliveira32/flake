{ pkgs, unstable, ... }:
{

  programs.opencode = {
    enable = true;
    package = unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.opencode;
    settings = {
      theme = "catppuccin";
      permission."*" = "ask";
    };
  };

}

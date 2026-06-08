{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = false; # Set in the Bash module
    presets = [ "nerd-font-symbols" ];
    settings.character = {
      success_symbol = "[ ❯](green)";
      error_symbol = "[ ✖](red)";
    };
  };
}

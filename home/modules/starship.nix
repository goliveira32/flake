{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = false; # Set in the Bash module.
    settings = {
      character = {
        success_symbol = "[](green)";
        error_symbol = "[](red)";
      };
      sudo = {
        disabled = false;
        symbol = " ";
      };
      battery.disabled = true;
      git_branch.symbol = " ";
      git_commit.tag_symbol = " ";
      directory.read_only = " ";
      nodejs.symbol = " ";
      php.symbol = " ";
      java.symbol = " ";
      python.symbol = " ";
      rust.symbol = " ";
    };
  };
}

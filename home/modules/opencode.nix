{ ... }:

{
  programs.opencode = {
    enable = true;
    settings = {
      autoupdate = false;
      permission."*" = "ask";
    };
  };
}

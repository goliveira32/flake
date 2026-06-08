{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = "[[ $(${pkgs.coreutils-full}/bin/tty) =~ ^/dev/pts/[0-9]+$ ]] && eval \"$(${pkgs.starship}/bin/starship init bash)\"";
    profileExtra = "[[ -z $WAYLAND_DISPLAY && $XDG_VTNR == 1 ]] && exec ${pkgs.hyprland}/bin/start-hyprland";
    sessionVariables.HISTFILE = "/dev/null";
    shellAliases = {
      la = "ls -A";
      ll = "ls -l";
    };
  };
}

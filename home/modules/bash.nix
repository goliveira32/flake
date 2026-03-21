{ ... }: {

  programs.bash = {
    enable = true;
    initExtra = "[[ $(tty) =~ ^/dev/pts/[0-9]+$ ]] && eval \"$(starship init bash)\"";
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec hyprland
      fi
    '';
    sessionVariables.HISTFILE = "/dev/null"; # Specific to Bash sessions.
    shellAliases = {
      la = "ls -A";
      ll = "ls -l";
    };
  };

}

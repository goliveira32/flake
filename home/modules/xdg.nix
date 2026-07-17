{ pkgs, ... }:

{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
      desktop = null;
      templates = null;
      publicShare = null;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.gnome.Papers.desktop";
        "image/gif" = "org.gnome.Loupe.desktop";
        "image/jpeg" = "org.gnome.Loupe.desktop";
        "image/png" = "org.gnome.Loupe.desktop";
        "image/svg+xml" = "org.gnome.Loupe.desktop";
        "image/svg+xml-compressed" = "org.gnome.Loupe.desktop";
        "image/webp" = "org.gnome.Loupe.desktop";
      };
    };
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };
}

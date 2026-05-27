{ pkgs, ... }:
{

  xdg = {
    desktopEntries = {
      pdf-handler = {
        name = "Default PDF Handler";
        exec = "${pkgs.papers}/bin/papers %F";
        noDisplay = true;
      };
      image-handler = {
        name = "Default Image Handler";
        exec = "${pkgs.loupe}/bin/loupe %F";
        noDisplay = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "pdf-handler.desktop";
        "image/gif" = "image-handler.desktop";
        "image/jpeg" = "image-handler.desktop";
        "image/png" = "image-handler.desktop";
        "image/svg+xml" = "image-handler.desktop";
        "image/svg+xml-compressed" = "image-handler.desktop";
        "image/webp" = "image-handler.desktop";
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

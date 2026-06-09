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
    desktopEntries = {
      DocumentViewer = {
        name = "Default Document Viewer";
        exec = "${pkgs.papers}/bin/papers %F";
        noDisplay = true;
      };
      ImageViewer = {
        name = "Default Image Viewer";
        exec = "${pkgs.loupe}/bin/loupe %F";
        noDisplay = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "DocumentViewer.desktop";
        "image/gif" = "ImageViewer.desktop";
        "image/jpeg" = "ImageViewer.desktop";
        "image/png" = "ImageViewer.desktop";
        "image/svg+xml" = "ImageViewer.desktop";
        "image/svg+xml-compressed" = "ImageViewer.desktop";
        "image/webp" = "ImageViewer.desktop";
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

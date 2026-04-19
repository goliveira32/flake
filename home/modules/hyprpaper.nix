{ ... }:
{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      splash = false;
      preload = "~/.config/wallpaper.png";
      wallpaper = ", ~/.config/wallpaper.png";
    };
  };

}

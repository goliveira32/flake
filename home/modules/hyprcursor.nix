{ meta, ... }:

{
  home.pointerCursor = {
    size = 26;
    hyprcursor = {
      enable = true;
      size = 26;
    };
  };

  catppuccin.cursors = {
    enable = true;
    accent = meta.theme.accent;
    flavor = meta.theme.flavor;
  };
}

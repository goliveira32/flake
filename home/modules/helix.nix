{ ... }: {

  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages.language = [
      {
        name = "markdown";
        soft-wrap.enable = true;
      }
      {
        name = "typst";
        soft-wrap.enable = true;
      }
    ];
    settings.theme = "custom";
    themes.custom = {
      inherits = "catppuccin_mocha";
      "ui.background" = {};
    };
  };

}

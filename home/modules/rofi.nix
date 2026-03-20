{ config, ... }: {

  programs.rofi = {
    enable = true;
    font = "Sans Serif 14";
    modes = [ "drun" ];
    extraConfig = {
      display-drun = "  ";
      show-icons = true;
    };
    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
      window = {
        width = 550;
        border = 2;
        border-radius = 10;
        border-color = mkLiteral "@flamingo";
        background-color = mkLiteral "#1e1e2ecc"; # Manually set @base with 80% opacity.
      };
      mainbox.padding = 8;
      inputbar = {
        padding = 6;
        children = map mkLiteral [ "prompt" "entry" ];
      };
      entry = {
        placeholder = "Search...";
        placeholder-color = mkLiteral "@overlay0";
      };
      listview = {
        border = 0;
        scrollbar = false;
      };
      element = {
        padding = 6;
        border-radius = 10;
      };
      "element.normal.normal".background-color = mkLiteral "inherit";
      "element.alternate.normal".background-color = mkLiteral "inherit";
      "element.selected.normal".background-color = mkLiteral "#6c708680"; # Manually set @overlay0 with 50% opacity.
      element-text.text-color = mkLiteral "@text";
    };
  };

  catppuccin.rofi = {
    enable = true;
    flavor = "mocha";
  };

}

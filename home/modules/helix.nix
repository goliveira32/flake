{ lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language-server = {
        marksman.command = "${pkgs.marksman}/bin/marksman";
        tombi.command = "${pkgs.tombi}/bin/tombi";
        rust-analyzer.command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        nixd.command = "${pkgs.nixd}/bin/nixd";
      };
      language = [
        {
          name = "markdown";
          soft-wrap.enable = true;
          auto-format = true;
          formatter = {
            command = "${pkgs.prettier}/bin/prettier";
            args = [
              "--parser"
              "markdown"
            ];
          };
          language-servers = [ "marksman" ];
        }
        {
          name = "typst";
          soft-wrap.enable = true;
        }
        {
          name = "toml";
          soft-wrap.enable = true;
          auto-format = true;
          formatter = {
            command = "${pkgs.tombi}/bin/tombi";
            args = [
              "format"
              "-"
            ];
          };
          language-servers = [ "tombi" ];
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
          language-servers = [ "nixd" ];
        }
      ];
    };
    settings.theme = lib.mkForce "custom";
    themes.custom = {
      inherits = "catppuccin-mocha";
      "ui.background" = { };
    };
  };

  catppuccin.helix.useItalics = true;
}

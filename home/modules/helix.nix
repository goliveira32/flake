{ pkgs, ... }: {

  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language-server = {
        rust-analyzer = with pkgs; {
          command = "${rust-analyzer}/bin/rust-analyzer";
        };
        nixd = with pkgs; {
          command = "${nixd}/bin/nixd";
        };
      };
      language = [
        {
          name = "markdown";
          soft-wrap.enable = true;
        }
        {
          name = "typst";
          soft-wrap.enable = true;
        }
        {
          name = "rust";
          auto-format = true;
          formatter = with pkgs; {
            command = "${rustfmt}/bin/rustfmt";
          };
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "nix";
          auto-format = true;
          formatter = with pkgs; {
            command = "${nixfmt}/bin/nixfmt";
          };
          language-servers = [ "nixd" ];
        }
      ];
    };
    settings.theme = "custom";
    themes.custom = {
      inherits = "catppuccin_mocha";
      "ui.background" = {};
    };
  };

}

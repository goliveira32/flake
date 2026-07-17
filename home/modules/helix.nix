{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language-server = {
        marksman.command = "${pkgs.marksman}/bin/marksman";
        typescript-language-server.command = "${pkgs.typescript-language-server}/bin/typescript-language-server";
        tombi.command = "${pkgs.tombi}/bin/tombi";
        rust-analyzer.command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        nixd.command = "${pkgs.nixd}/bin/nixd";
        terraform-ls.command = "${pkgs.terraform-ls}/bin/terraform-ls";
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
          name = "typescript";
          auto-format = true;
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "toml";
          soft-wrap.enable = true;
          auto-format = true;
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
        {
          name = "hcl";
          auto-format = true;
          language-servers = [ "terraform-ls" ];
        }
      ];
    };
  };

  catppuccin.helix.useItalics = true;
}

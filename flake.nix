{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      catppuccin,
      home-manager,
      ...
    }:
    let
      meta = fromTOML (builtins.readFile ./meta.toml);
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          ./core
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${meta.system.username}.imports = [
                ./home
                catppuccin.homeModules.catppuccin
              ];
              extraSpecialArgs = {
                inherit meta;
                assets = ./home/assets;
              };
            };
          }
        ];
        specialArgs = { inherit meta; };
      };
    };
}

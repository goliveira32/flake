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
      settings = {
        username = "penguin";
        hostname = "linux";
        timezone = "Europe/Lisbon";
        locale = "en_US.UTF-8";
        keymap = "pt-latin1";
        systemState = "25.11";
        homeState = "25.11";
        development = {
          username = "goliveira32";
          email = "goncalo.oliveira@tuta.com";
        };
      };
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        modules = [
          ./core
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${settings.username}.imports = [
                ./home
                catppuccin.homeModules.catppuccin
              ];
              extraSpecialArgs = { inherit settings; };
            };
          }
        ];
        specialArgs = { inherit settings; };
      };
    };

}

{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    catppuccin.url = "github:catppuccin/nix/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, ... } @ inputs: let
    settings = {
      username = "penguin";
      hostname = "linux";
      timezone = "Europe/Lisbon";
      locale = "en_US.UTF-8";
      keymap = "pt-latin1";
      systemState = "25.11";
      homeState = "25.11";
    };
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      modules = [
        ./core
        home-manager.nixosModules.default {
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

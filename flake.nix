{
  description = "mtnptrsn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs: rec {

    systems = {
      linux = "x86_64-linux";
      macos = "aarch64-darwin";
    };

    homeConfigurations =
      let
        linuxModules = [ ./hosts/linux.nix ./homes/linux.nix ];
      in
      {
        "mtnptrsn" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems.linux};
          modules = linuxModules;
        };
      };

    darwinConfigurations =
      let
        darwinModules = [
          ./hosts/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mtnptrsn = import ./homes/darwin.nix;
          }
        ];
      in
      {
        "mtnptrsn" = darwin.lib.darwinSystem {
          system = systems.macos;
          modules = darwinModules;
        };
      };
  };
}

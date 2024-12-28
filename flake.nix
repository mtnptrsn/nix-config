# flake.nix

{
  description = "mtnptrsn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations = {
        "mtnptrsn" = home-manager.lib.homeManagerConfiguration {
          # system = "x86_64-linux";
          # pkgs = nixpkgs.legacyPackages.${system};

          inherit pkgs;

          system = "x86_64-linux";
          modules = [ ./linux.nix ./home-manager/home.nix ];
        };
      };

      darwinConfigurations = {
        "mtnptrsn" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mtnptrsn = import ./home-manager/home.nix;
            }
          ];
        };
      };
    };

}

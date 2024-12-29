{
  description = "mtnptrsn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { self, nixpkgs, home-manager, darwin, nix-homebrew, ... }@inputs:
    let
      systems = {
        linux = "x86_64-linux";
        macos = "aarch64-darwin";
      };
      username = "mtnptrsn";
    in
    {
      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems.linux};
          modules = [ ./hosts/linux.nix ./homes/linux.nix ];
        };
      };

      darwinConfigurations = {
        ${username} = darwin.lib.darwinSystem {
          modules = [
            ./hosts/darwin.nix
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = username;
              };
            }
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./homes/darwin.nix;
            }
          ];
        };
      };
    };
}

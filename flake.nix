{
  description = "mtnptrsn";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    # nixpkgsDarwin = {
    #   url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      # Assume we use nixpkgs from Linux for Home Manager purposes across systems
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nix-darwin, ... }:
    let
      linuxSystem = "x86_64-linux";
      darwinSystem = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${linuxSystem};
    in
    {
      homeConfigurations."mtnptrsn-linux" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
      };

      # homeConfigurations."mtnptrsn-darwin" = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgsDarwin;
      #   modules = [ ./home-manager/home.nix ];
      # };

      darwinConfigurations."mtnptrsn-darwin" = nix-darwin.lib.darwinSystem {
        # inherit pkgsDarwin;
        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mtnptrsn = import ./home-manager/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
}

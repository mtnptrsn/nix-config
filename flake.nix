{
  description = "mtnptrsn";

  inputs = {
    nixpkgsLinux = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixpkgsDarwin = {
      url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      # Assume we use nixpkgs from Linux for Home Manager purposes across systems
      inputs.nixpkgs.follows = "nixpkgsLinux";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgsDarwin";
    };
  };

  outputs = inputs@{ nixpkgsLinux, nixpkgsDarwin, home-manager, nix-darwin, ... }:
    let
      linuxSystem = "x86_64-linux";
      darwinSystem = "aarch64-darwin";
      pkgsLinux = nixpkgsLinux.legacyPackages.${linuxSystem};
      pkgsDarwin = nixpkgsDarwin.legacyPackages.${darwinSystem};
    in
    {
      homeConfigurations."mtnptrsn-linux" = home-manager.lib.homeManagerConfiguration {
        inherit pkgsLinux;
        modules = [ ./home-manager/home.nix ];
      };

      homeConfigurations."mtnptrsn-darwin" = home-manager.lib.homeManagerConfiguration {
        inherit pkgsDarwin;
        modules = [ ./home-manager/home.nix ];
      };

      # darwinConfigurations."mtnptrsn" = nix-darwin.lib.darwinSystem {
      #   inherit pkgsDarwin;
      #   modules = [ ./darwin/darwin.nix ];
      # };
    };
}

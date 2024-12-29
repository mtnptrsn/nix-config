{ nix-homebrew, home-manager, ... }:

let
  userName = "mtnptrsn";
in
[
  nix-homebrew.darwinModules.nix-homebrew
  {
    nix-homebrew = {
      enable = true;
      enableRosetta = true;
      user = userName;
    };
  }
  home-manager.darwinModules.home-manager
  {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${userName} = import ./homes/darwin.nix;
  }
]

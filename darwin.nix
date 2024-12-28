# darwin.nix

{ pkgs, system, ... }:

{
  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/Users/mtnptrsn";
  };

  system.stateVersion = 5;
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}

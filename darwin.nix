# darwin.nix

{ pkgs, system, ... }:

{
  # users.users.mtnptrsn = {
  #   name = "mtnptrsn";
  #   home = "/Users/mtnptrsn";
  # };
  home.username = "mtnptrsn";
  home.homeDirectory = "/Users/mtnptrsn";

  system.stateVersion = 5;
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
}

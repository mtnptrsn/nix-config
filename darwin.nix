# darwin.nix

{ pkgs, ... }:

{
  services.nix-daemon.enable = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/Users/mtnptrsn";
  };
}

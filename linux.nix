# darwin.nix

{ pkgs, ... }:

{
  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/home/mtnptrsn";
  };
}

{ pkgs, system, ... }:

{
  system.stateVersion = 5;

  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/home/mtnptrsn";
  };
}

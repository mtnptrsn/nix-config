{ pkgs, system, ... }:

{
  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/home/mtnptrsn";
  };
}

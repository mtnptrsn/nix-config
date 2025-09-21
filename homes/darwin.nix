{ pkgs, ... }:

{
  home.packages = with pkgs; [
    coreutils-full
    gnused
  ];
  imports = [
    ./common.nix
  ];
}

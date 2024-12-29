{ pkgs, system, ... }:

{
  imports = [
    ../modules/darwin/alacritty.nix
    ./common.nix
  ];

  programs.graphical.apps.alacritty.enable = true;
}

{ pkgs, system, ... }:

{
  home.packages = with pkgs; [
    xclip
  ];

  programs = {
    # Only enable on linux since GUI's are installed
    # with homebrew on mac
    alacritty.enable = true;
  };

  imports = [
    ./common.nix
  ];
}

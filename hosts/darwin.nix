{ pkgs, system, config, ... }:

{
  system.stateVersion = 5;

  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/Users/mtnptrsn";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # homebrew = {
  #   enable = true;
  #   casks = [
  #     "google-chrome"
  #     "discord"
  #     "1password"
  #     "spotify"
  #     "alfred"
  #     "alacritty"
  #     "obsidian"
  #     "docker"
  #     "trezor-suite"
  #     "transmission"
  #     "audacity"
  #   ];
  #   onActivation.cleanup = "zap";
  #   onActivation.autoUpdate = true;
  #   onActivation.upgrade = true;
  # };
}

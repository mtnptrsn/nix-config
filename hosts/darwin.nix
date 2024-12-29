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

  homebrew = {
    enable = true;
    casks = import ./casks.nix;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}

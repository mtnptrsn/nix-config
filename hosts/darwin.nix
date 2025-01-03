{ pkgs, ... }:

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
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    masApps = {
      "Xcode" = 497799835;
    };
  };
}

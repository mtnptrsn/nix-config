{ pkgs, ... }:

{
  system.stateVersion = 5;


  system.defaults =
    {
      dock.autohide = true;
      universalaccess.reduceMotion = true;
      NSGlobalDomain."com.apple.swipescrolldirection" = false;
      NSGlobalDomain.NSScrollAnimationEnabled = false;
    };

  users.users.mtnptrsn = {
    name = "mtnptrsn";
    home = "/Users/mtnptrsn";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
  ];

  homebrew = {
    enable = true;
    casks = import ./casks.nix;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}

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
    casks = [
      "google-chrome"
      "discord"
      "1password"
      "spotify"
      "alfred"
      "alacritty"
      "obsidian"
      "docker"
      "trezor-suite"
      "transmission"
      "audacity"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      	  # Set up applications.
      	  echo "setting up /Applications..." >&2
      	  rm -rf /Applications/Nix\ Apps
      	  mkdir -p /Applications/Nix\ Apps
      	  find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      	  while read src; do
      	    app_name=$(basename "$src")
      	    echo "copying $src" >&2
      	    ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      	  done
      	      '';
}

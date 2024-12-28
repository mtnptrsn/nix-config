{ nixpkgs, services, system, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  # system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 5;
  system.defaults = {
    dock.autohide = true;
  };
}

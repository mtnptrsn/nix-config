{ config, lib, namespace, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.apps.alacritty;
in
{
  options.${namespace}.programs.graphical.apps.alacritty = {
    enable = mkBoolOpt false "Whether or not to enable alacritty.";
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [ "alacritty" ];
    };
  };
}

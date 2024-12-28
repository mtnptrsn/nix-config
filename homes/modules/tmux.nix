{ pkgs, ... }:

{
  programs.tmux = {
    prefix = "C-s";
    baseIndex = 1;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "cpu-usage ram-usage time"
          set -g @dracula-refresh-rate 5
          set -g @dracula-show-left-icon session
          set -g @dracula-show-empty-plugins false
          set -g @dracula-show-powerline false
          set -g @dracula-military-time true
          set -g @dracula-day-month true
        '';
      }
    ];
  };
}

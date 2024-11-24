{ pkgs, ... }:

{
  home.username = "mtnptrsn";
  home.homeDirectory = "/home/mtnptrsn";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    nodejs_20
    ripgrep
    fira-code
    pipx
    gnumake
    gcc
    zip
    unzip
    python3
    cargo
  ];

  home.file = {
    ".config/nvim".source = ../dotfiles/nvim;
  };

  home.sessionVariables = {
    EDITOR = "neovim";
    TERM = "alacritty";
  };

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
    ripgrep = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "mtnptrsn";
      userEmail = "mtnptrsn@gmail.com";
    };
    zsh = {
      enable = true;
      "oh-my-zsh" = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "sudo"
          "web-search"
        ];
      };
    };
    eza = { enable = true; };
    fzf = { enable = true; enableZshIntegration = true; };
    zoxide = { enable = true; };
    tmux = {
      enable = true;
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
    home-manager.enable = true;
  };
}

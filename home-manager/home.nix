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
    docker
  ];
  home.file = {
    ".config/nvim".source = ../dotfiles/nvim;
  };
  home.sessionVariables = {
    EDITOR = "neovim";
    TERM = "alacritty";
  };
  programs = {
    neovim.enable = true;
    ripgrep.enable = true;
    git.enable = true;
    zsh.enable = true;
    eza.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    tmux.enable = true;
    home-manager.enable = true;
  };
  imports = [
    ./modules/tmux.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/fzf.nix
  ];
}

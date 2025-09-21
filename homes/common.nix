{ pkgs, ... }:

{
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    nodejs_22
    fira-code
    pipx
    gnumake
    zip
    unzip
    cargo
    python3
    python3Packages.pip
    docker
    rustc
    pnpm
    lua54Packages.luarocks
    lua54Packages.tl
    lua54Packages.lua
    tree
  ];
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
    ./modules/zsh/zsh.nix
    ./modules/git.nix
    ./modules/neovim/neovim.nix
    ./modules/fzf.nix
    ./modules/alacritty/alacritty.nix
  ];
}

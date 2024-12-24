{
  home.file = {
    ".config/nvim".source = ../../dotfiles/nvim;
  };
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };
  home.sessionVariables.EDITOR = "nvim";
}

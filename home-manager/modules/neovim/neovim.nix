{
  home.file = {
    ".config/nvim".source = ./config;
  };
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };
  home.sessionVariables.EDITOR = "nvim";
}

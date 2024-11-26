{
  programs.zsh = {
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
}

{
  programs.zsh = {
    "oh-my-zsh" = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      dsa = "docker stop $(docker ps -a -q)";
      cd = "z";
    };
  };
  home.file.".scripts".source = ./scripts;
}

# TODO: Migrate from toml to pure flake

{
  home.sessionVariables.TERM = "alacritty";
  home.file.".alacritty.toml".source = ./alacritty.toml;
}

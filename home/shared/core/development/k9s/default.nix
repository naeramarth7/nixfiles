{ config, ... }:
{
  programs.k9s.enable = true;

  home.sessionVariables = {
    K9S_CONFIG_DIR = "${config.home.homeDirectory}/.config/k9s";
  };
}

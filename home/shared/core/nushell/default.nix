{ config, ... }:
{
  imports = [
    ./carapace.nix
    ./starship.nix
  ];

  programs.nushell = {
    enable = true;
    extraConfig = ''
      source ./mod.nu
    '';
  };

  # link raw nushell config
  home.file."${config.xdg.configHome}/nushell" = {
    source = ./config;
    recursive = true;
  };
}

{ config, ... }:
{
  imports = [
    ./carapace.nix
    ./starship.nix
  ];

  programs.nushell = {
    enable = true;
    # Use ~/.config/nushell on macOS as well
    configDir = "${config.xdg.configHome}/nushell";
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

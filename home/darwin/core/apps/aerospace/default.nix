{ config, ... }: {
  programs.aerospace = {
    enable = true;
    launchd.enable = true;
  };

  home.file."${config.xdg.configHome}/aerospace/aerospace.toml".source = ./aerospace.toml;
}

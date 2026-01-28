{ pkgs, config, ... }: {
  programs.sketchybar = {
    enable = true;
    service.enable = true;
    configType = "bash";
  };

  home.packages = with pkgs; [
    sketchybar-app-font
  ];

  home.file."${config.xdg.configHome}/sketchybar".source = ./config;
}

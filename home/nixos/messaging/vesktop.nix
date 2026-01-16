{ pkgs, ... }:
let
  discordApp = "vesktop.desktop";
  associations = {
    "x-scheme-handler/discord" = discordApp;
  };
in
{

  home.packages = with pkgs; [
    vesktop # discord client
  ];

  xdg.mimeApps.enable = true;
  xdg.mimeApps.associations.added = associations;
  xdg.mimeApps.defaultApplications = associations;
}

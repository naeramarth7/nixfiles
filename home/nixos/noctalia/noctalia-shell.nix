{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
  };

  home.packages = with pkgs; [
    glib # "gsettings" needed by noctalia to apply "gtk-1" themes

    cliphist # used by clipper plugin
  ];

  # noctalia copies files from store with 444 permissions and
  # therefore fails to update them later on. Make sure they have proper
  # permissions by creating them and explicity changing permissions in
  # case they were already created in a previous version.
  home.activation.themeFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${config.xdg.configHome}/gtk-4.0
    touch ${config.xdg.configHome}/gtk-4.0/gtk.css
    chmod 644 ${config.xdg.configHome}/gtk-4.0/gtk.css

    mkdir -p ${config.xdg.configHome}/gtk-3.0
    touch ${config.xdg.configHome}/gtk-3.0/gtk.css
    chmod 644 ${config.xdg.configHome}/gtk-3.0/gtk.css

    mkdir -p ${config.xdg.configHome}/qt5ct/colors
    touch ${config.xdg.configHome}/qt5ct/colors/noctalia.conf
    chmod 644 ${config.xdg.configHome}/qt5ct/colors/noctalia.conf

    mkdir -p ${config.xdg.configHome}/qt6ct/colors
    touch ${config.xdg.configHome}/qt6ct/colors/noctalia.conf
    chmod 644 ${config.xdg.configHome}/qt6ct/colors/noctalia.conf

    mkdir -p ${config.xdg.configHome}/spicetify/Themes/Comfy
    touch ${config.xdg.configHome}/spicetify/Themes/Comfy/color.ini
    chmod 644 ${config.xdg.configHome}/spicetify/Themes/Comfy/color.ini

    mkdir -p ${config.xdg.configHome}/fuzzel/themes
    touch ${config.xdg.configHome}/fuzzel/themes/noctalia
    chmod 644 ${config.xdg.configHome}/fuzzel/themes/noctalia

    mkdir -p ${config.home.homeDirectory}/.local/share/color-schemes
    touch ${config.home.homeDirectory}/.local/share/color-schemes/noctalia.colors
    chmod 644 ${config.home.homeDirectory}/.local/share/color-schemes/noctalia.colors
  '';
}

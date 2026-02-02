{ pkgs, ... }:
{
  home.packages = [
    pkgs.adw-gtk3
    pkgs.adwaita-icon-theme
  ];

  gtk.enable = true;
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = true;
  };
  gtk.gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = true;
  };

  dconf.enable = true;
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}

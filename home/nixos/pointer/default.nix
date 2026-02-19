{ pkgs, ... }:
let
  cursorThemePkg = pkgs.bibata-cursors-translucent;
  cursorThemeName = "Bibata_Ghost";
in
{

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = cursorThemePkg;
    name = "${cursorThemeName}";
    size = 24;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "${cursorThemeName}";
      package = cursorThemePkg;
    };
    # Note the different syntax for gtk3 and gtk4
    gtk3.extraConfig = {
      "gtk-cursor-theme-name" = "${cursorThemeName}";
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-cursor-theme-name=${cursorThemeName}
      '';
    };
  };
}

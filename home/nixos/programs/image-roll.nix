{ pkgs, ... }:
let
  imageViewer = "com.github.weclaw1.ImageRoll.desktop";
  associations = {
    "image/png" = imageViewer;
    "image/jpeg" = imageViewer;
    "image/gif" = imageViewer;
    "image/bmp" = imageViewer;
    "image/tiff" = imageViewer;
    "image/*" = "org.gnome.eog.desktop";
  };
in
{
  home.packages = with pkgs; [
    image-roll
    nautilus
  ];

  xdg.mimeApps.enable = true;
  xdg.mimeApps.associations.added = associations;
  xdg.mimeApps.defaultApplications = associations;
}

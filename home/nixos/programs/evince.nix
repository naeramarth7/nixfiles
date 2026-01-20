{ pkgs, ... }:
let
  pdfViewer = "evince.desktop";
  associations = {
    "application/pds" = pdfViewer;
  };
in
{
  home.packages = with pkgs; [
    evince
  ];

  xdg.mimeApps.enable = true;
  xdg.mimeApps.associations.added = associations;
  xdg.mimeApps.defaultApplications = associations;

}

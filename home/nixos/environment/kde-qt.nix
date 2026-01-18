{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qt6gtk2
  ];

  qt.style = {
    name = "Fusion";
  };
}

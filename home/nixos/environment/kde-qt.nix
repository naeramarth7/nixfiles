{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qt6gtk2

    #   # libsForQt5.kwayland
    #   # libsForQt5.qt5.qtwayland
    #   libsForQt5.qt5ct
    #   # libsForQt5.qtstyleplugin-kvantum
    #   kdePackages.kdialog
    #   kdePackages.breeze
    #   xdg-desktop-portal
  ];

  qt.style = {
    name = "Fusion";
  };
}

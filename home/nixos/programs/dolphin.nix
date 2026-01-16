{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg # svg icons
    kdePackages.ark # archive support
    kdePackages.kio-extras # for root access
    kdePackages.kio-admin # for root access
    kdePackages.kservice

    # perviewers and thumbnailers
    kdePackages.kdesdk-thumbnailers
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kimageformats
    kdePackages.qtimageformats
    icoutils
    libheif

    # ### TESTING

    # shared-mime-info
    # xdg-utils
    # desktop-file-utils

    # # KDE runtime bits Dolphin needs
    # # kdePackages.kservice
    # kdePackages.kio
    # kdePackages.kconfig
    # kdePackages.kcoreaddons
  ];

  home.file.".local/share/kio/servicemenus/open-in-wezterm.desktop".source =
    ./dolphin/service-menu/open-in-dolphin.desktop;

  ### TESTING

  # # Enable XDG integration
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal
  #   ];
  #   configPackages = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal
  #   ];
  # };

}

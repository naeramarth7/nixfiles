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
  ];

  home.file.".local/share/kio/servicemenus/open-in-ghostty.desktop".source =
    ./dolphin/service-menu/open-in-dolphin.desktop;

}

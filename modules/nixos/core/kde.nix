{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qt6gtk2
    adwaita-qt
    adwaita-qt6
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  qt.style = {
    name = "Adwaita-Dark";
  };

  # @Dolphin
  # Ensure KDE applications menu is available
  environment.etc."xdg/menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
}

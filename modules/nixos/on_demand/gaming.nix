{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    lutris
    mangohud
    winetricks
    wineWow64Packages.stable
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}

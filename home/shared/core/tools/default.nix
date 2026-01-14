{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    curl
    p7zip
    pv
    tealdeer
    unar
    wakeonlan
    watch
    watchman
    wget
  ];
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    curl
    dig
    pv
    tealdeer
    toybox
    unar
    wakeonlan
    watchman
    wget
  ];
}

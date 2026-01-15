{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    curl
    dig
    pv
    tealdeer
    unar
    wakeonlan
    watch
    watchman
    wget
  ];
}

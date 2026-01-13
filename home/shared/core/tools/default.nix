{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    curl
    p7zip
    tealdeer
    unar
    wakeonlan
    watch
    watchman
    wget
  ];
}

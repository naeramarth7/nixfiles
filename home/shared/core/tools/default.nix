{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    curl
    dig
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

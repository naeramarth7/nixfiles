{ pkgs, ... }:
{
  home.packages = with pkgs; [
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

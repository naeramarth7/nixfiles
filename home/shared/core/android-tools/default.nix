{ pkgs, ... }:
{
  home.packages = with pkgs; [
    android-tools
    universal-android-debloater
    revanced-cli
    apkeditor
  ];
}

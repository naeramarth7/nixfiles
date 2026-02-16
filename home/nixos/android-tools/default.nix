{ pkgs, ... }:
{
  home.packages = with pkgs; [
    universal-android-debloater
    revanced-cli
    apkeditor
  ];
}

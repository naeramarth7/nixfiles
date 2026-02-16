{ pkgs, ... }:
let
  vlcPkg =
      if pkgs.stdenv.isDarwin
        then pkgs.vlc-bin
        else pkgs.vlc;
  in
{
  home.packages = with pkgs; [
    vlcPkg
  ];
}

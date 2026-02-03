{ pkgs, ... }:
let
  thunderbirdPkg =
      if pkgs.stdenv.isDarwin
        then pkgs.thunderbird-bin
        else pkgs.thunderbird;
  in
{
  home.packages = with pkgs; [
    thunderbirdPkg
  ];
}

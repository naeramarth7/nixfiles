{ pkgs, ... }:
let
  ghosttyPkg =
      if pkgs.stdenv.isDarwin
        then pkgs.ghostty-bin
        else pkgs.ghostty;
  in
{
  home.packages = with pkgs; [
    ghosttyPkg
  ];
}

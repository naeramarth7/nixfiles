{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools

    ./syncthing.nix
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    openssh
  ];
}

{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools

    ./obsidian.nix
    ./syncthing.nix
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    openssh
  ];
}

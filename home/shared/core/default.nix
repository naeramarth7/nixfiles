{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools

    ./obsidian.nix
    ./syncthing.nix

    ./thunderbird.nix
    ./nushell
  ];

  home.packages = with pkgs; [
    findutils
    moreutils
    openssh
  ];
}

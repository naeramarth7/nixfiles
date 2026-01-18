{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools

    ./nushell
    ./obsidian.nix
    ./syncthing.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    openssh
  ];
}

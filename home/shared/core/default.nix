{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools

    ./nix.nix
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

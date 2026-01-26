{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools

    ./nix.nix
    ./shell
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

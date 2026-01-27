{ pkgs, ... }:
{
  imports = [
    ./nix.nix

    ./development
    ./internet
    ./obsidian.nix
    ./shell
    ./syncthing.nix
    ./thunderbird.nix
    ./tools
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    openssh
  ];
}

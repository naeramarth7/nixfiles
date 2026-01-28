{ pkgs, ... }:
{
  imports = [
    ./nix.nix

    ./chezmoi.nix
    ./development
    ./internet
    ./obsidian.nix
    ./shell
    ./spicetify.nix
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

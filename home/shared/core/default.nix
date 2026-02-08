{ pkgs, ... }:
{
  imports = [
    ./nix.nix

    ./android-tools
    ./chezmoi.nix
    ./development
    ./internet
    ./neovim.nix
    ./obsidian.nix
    ./shell
    ./spicetify.nix
    ./syncthing.nix
    ./thunderbird.nix
    ./tools
    ./vlc
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    unixtools.watch
    openssh
  ];
}

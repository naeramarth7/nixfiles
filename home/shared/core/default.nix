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
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    openssh
  ];
}

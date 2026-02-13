{ pkgs, ... }:
{
  imports = [
    ./nix.nix

    ./android-tools
    ./chezmoi.nix
    ./claude-code
    ./development
    ./internet
    ./neovim.nix
    ./obsidian.nix
    ./shell
    ./sops
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

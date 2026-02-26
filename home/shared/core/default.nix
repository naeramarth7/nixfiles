{ pkgs, ... }:
{
  imports = [
    ./nix.nix

    ./android-tools
    ./chezmoi.nix
    ./claude-code
    ./development
    ./github-copilot-cli
    ./internet
    ./mise
    ./neovim.nix
    ./obsidian.nix
    ./shell
    ./sops
    ./spicetify.nix
    ./ssh
    ./services
    ./thunderbird.nix
    ./tools
    ./victoriametrics
    ./vlc
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    rsync
    unixtools.watch
  ];
}

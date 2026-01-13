{ user, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./home-manager.nix
    ./homebrew.nix
  ];

  programs._1password.enable = true;
  programs._1password-gui.enable = true;
}

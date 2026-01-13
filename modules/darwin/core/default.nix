{ user, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./home-manager.nix
    ./homebrew.nix
  ];
}

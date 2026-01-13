{ pkgs, ... }:
{
  imports = [
    ./1password.nix
  ];

  home.packages = with pkgs; [
    todoist # cli
    todoist-electron
  ];
}

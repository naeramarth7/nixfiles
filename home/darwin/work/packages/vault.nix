{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vault-bin
  ];
}

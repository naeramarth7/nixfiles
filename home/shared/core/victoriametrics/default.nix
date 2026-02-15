{ pkgs, ... }:
{
  home.packages = with pkgs; [
    victoriametrics
  ];
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unigine-heaven
    unigine-valley
  ];
}

{ pkgs, ... }:
{
  programs.git = {
    enable = true;
  };

  home.packages = [
    pkgs.diff-so-fancy
    pkgs.git-lfs
    pkgs.git-recent
  ];
}

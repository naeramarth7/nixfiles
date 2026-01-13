{ pkgs, ... }:
{
  imports = [
    ./development
    ./internet
    ./tools
  ];

  home.packages = with pkgs; [
    coreutils
    findutils
    moreutils
    openssh
  ];
}

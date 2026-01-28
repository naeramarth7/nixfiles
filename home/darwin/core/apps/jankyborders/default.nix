{ account, pkgs, ... }:
{
  home.packages = with pkgs; [
    jankyborders
  ];
}

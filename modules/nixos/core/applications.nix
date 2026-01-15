{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      inter
      roboto
      roboto-flex
      roboto-mono
    ];
  };
}

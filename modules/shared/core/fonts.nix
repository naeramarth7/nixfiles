{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      inter
      nerd-fonts._0xproto
    ];
  };
}

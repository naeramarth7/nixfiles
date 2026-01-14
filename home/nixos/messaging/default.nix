{ pkgs, ... }:
{
  imports = [
    ./whatsapp.nix
  ];

  home.packages = with pkgs; [
    vesktop # discord client
  ];
}

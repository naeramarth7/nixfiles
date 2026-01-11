{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt # nix formatter
    nixd # nix language server
  ];
}

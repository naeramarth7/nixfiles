{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.snappy-switcher.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

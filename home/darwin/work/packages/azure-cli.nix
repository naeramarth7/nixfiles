{ pkgs-stable, ... }: {
  home.packages = [
    # TODO: Wait for 2.82.0
    #  see https://github.com/NixOS/nixpkgs/issues/493712
    #  see https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/az/azure-cli/package.nix#L29
    pkgs-stable.azure-cli
  ];
}

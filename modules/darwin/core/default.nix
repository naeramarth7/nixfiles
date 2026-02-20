_: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../shared/core

    ./homebrew.nix
    ./packages
    ./system
  ];
}

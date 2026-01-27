_: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../shared/core

    ./1password.nix
    ./system.nix
    ./homebrew.nix
    ./users.nix
  ];
}

_: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../shared/core

    ./1password.nix
    ./homebrew.nix
    ./macos
    ./system.nix
    ./users.nix
  ];
}

_: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../shared/core

    ./system.nix
    ./home-manager.nix
    ./homebrew.nix
  ];

  programs._1password.enable = true;
  programs._1password-gui.enable = true;
}

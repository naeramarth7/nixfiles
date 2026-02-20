_: {
  services.syncthing.enable = true;

  imports = [
    ./devices.nix
    ./folders.nix
  ];
}

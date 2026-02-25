_: {
  imports = [
    ./gdm.nix
    ./gnome-keyring.nix
    ./display.nix
    ./firewall.nix
    ./hyprland.nix
  ];

  services.dbus.enable = true;

  # Run unpatched dynamic binaries on NixOS.
  # Useful for e.g. mise
  programs.nix-ld.enable = true;
}

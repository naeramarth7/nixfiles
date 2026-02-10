_: {
  imports = [
    ./authentication.nix
    ./display.nix
    ./firewall.nix
    ./hyprland.nix
  ];

  services.dbus.enable = true;
}

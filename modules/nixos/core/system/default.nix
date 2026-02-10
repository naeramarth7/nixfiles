_: {
  imports = [
    ./authentication.nix
    ./display.nix
    ./firewall.nix
    ./hyprland.nix
    ./walker.nix
  ];

  services.dbus.enable = true;
}

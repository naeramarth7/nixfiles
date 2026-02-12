_: {
  imports = [
    ./gdm.nix
    ./gnome-keyring.nix
    ./display.nix
    ./firewall.nix
    ./hyprland.nix
  ];

  services.dbus.enable = true;
}

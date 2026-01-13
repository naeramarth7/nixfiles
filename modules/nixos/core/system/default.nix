{ ... }:
{
  imports = [
    ./authentication.nix
    ./display.nix
    ./firewall.nix
    ./niri.nix
  ];

  services.dbus.enable = true;
}

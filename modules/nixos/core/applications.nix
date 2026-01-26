{ pkgs, ... }:
{
  system.fsPackages = with pkgs; [
    usbutils
    pciutils
  ];
}

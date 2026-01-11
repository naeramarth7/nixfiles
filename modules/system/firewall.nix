{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firewalld-gui
  ];

  # required by firewalld
  networking.nftables.enable = true;

  # Enable the service
  services.firewalld = {
    enable = true;
  };
}

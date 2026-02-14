{ pkgs, lib, ... }:
{
  # automount usb devices
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # file_manager = "${pkgs.xdg-utils}/bin/xdg-open"
        # replace with your favorite file manager
        file_manager = "${lib.getExe pkgs.kdePackages.dolphin}";
      };
    };
  };
}

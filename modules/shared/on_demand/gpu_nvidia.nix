# https://wiki.nixos.org/wiki/NVIDIA

{ config, ... }:

{
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    kernelParams = [ "nvidia.NVreg_TemporaryFilePath=/var/tmp" ];
  };

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # nixos.wiki/wiki/Nvidia
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    open = true;

    # Install Nvidia settings menu
    nvidiaSettings = true;

    # Prefered driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}

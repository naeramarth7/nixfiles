# https://wiki.nixos.org/wiki/NVIDIA

{ config, pkgs, ... }:

{
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    kernelParams = [ "nvidia.NVreg_TemporaryFilePath=/var/tmp" ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

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
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  hardware.graphics = {
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  # GPU overclocking / undervolting tool
  services.lact = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    mangojuice
    goverlay

    mesa-demos

    vulkan-loader
    vulkan-tools
    vulkan-headers
    vulkan-validation-layers
    vulkan-extension-layer
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
    VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
  };
}

_: {
  networking.hostName = "xsh-workstation-nix-01";

  imports = [
    # hardware conffigurations
    ./hardware-configuration.nix

    ../../../modules/shared/on_demand/fs_btrfs.nix
    ../../../modules/shared/on_demand/gpu_nvidia.nix

    # mounts
    ../../../modules/shared/on_demand/mount_xsh-nas-01.nix

    # others
    ../../../modules/nixos/on_demand/gaming.nix
    ../../../modules/nixos/on_demand/openrgb.nix
  ];
}

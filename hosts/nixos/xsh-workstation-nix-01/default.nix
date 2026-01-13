_: {
  networking.hostName = "xsh-workstation-nix-01";

  imports = [
    # hardware conffigurations
    ./hardware-configuration.nix

    ../../../modules/shared/on_demand/fs_btrfs.nix
    ../../../modules/shared/on_demand/gpu_nvidia.nix

    # services
    ../../../modules/nixos/on_demand/ollama.nix

    # mounts
    ../../../modules/shared/on_demand/mount_xsh-nas-01.nix
  ];
}

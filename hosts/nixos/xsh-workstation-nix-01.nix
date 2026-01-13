{ ... }:

{
  networking.hostName = "xsh-workstation-nix-01";

  imports = [
    ../../modules/shared/on_demand/fs_btrfs.nix
    ../../modules/shared/on_demand/gpu_nvidia.nix

    ../../modules/shared/on_demand/mount_xsh-nas-01.nix
  ];
}

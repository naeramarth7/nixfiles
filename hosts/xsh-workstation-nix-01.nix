{ ... }:

{
  networking.hostName = "xsh-workstation-nix-01";

  imports = [
    ../modules/nixos.nix
    ../hardware/nvidia-gpu.nix

    ../mounts/xsh-nas-01.nix
  ];
}

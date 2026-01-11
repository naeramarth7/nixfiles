{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.cifs-utils ];

  systemd.tmpfiles.rules = [
    "d /mnt/nas/media 0770 svenh users - -"
    "d /mnt/nas/svenh 0700 svenh users - -"
  ];

  fileSystems."/mnt/nas/media" = {
    device = "//10.0.30.90/media";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=/home/svenh/.config/samba/credentials,uid=1000,gid=568" ];
  };

  fileSystems."/mnt/nas/svenh" = {
    device = "//10.0.30.90/svenh";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=/home/svenh/.config/samba/credentials,uid=1000,gid=100" ];
  };
}

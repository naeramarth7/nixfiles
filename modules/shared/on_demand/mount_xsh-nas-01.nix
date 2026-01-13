{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.cifs-utils ];

  systemd.tmpfiles.rules = [
    "d /mnt/nas/media 0770 ${user.accountName} users - -"
    "d /mnt/nas/${user.accountName} 0700 ${user.accountName} users - -"
  ];

  fileSystems."/mnt/nas/media" = {
    device = "//10.0.30.90/media";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [
        "${automount_opts},credentials=/home/${user.accountName}/.config/samba/credentials,uid=1000,gid=568"
      ];
  };

  fileSystems."/mnt/nas/${user.accountName}" = {
    device = "//10.0.30.90/svenh";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [
        "${automount_opts},credentials=/home/${user.accountName}/.config/samba/credentials,uid=1000,gid=100"
      ];
  };
}

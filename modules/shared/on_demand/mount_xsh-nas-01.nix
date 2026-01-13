{ account, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.cifs-utils ];

  systemd.tmpfiles.rules = [
    "d /mnt/nas/media 0770 ${account.username} users - -"
    "d /mnt/nas/${account.username} 0700 ${account.username} users - -"
  ];

  fileSystems."/mnt/nas/media" = {
    device = "//10.0.30.90/media";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [
        "${automount_opts},credentials=/home/${account.username}/.config/samba/credentials,uid=1000,gid=568"
      ];
  };

  fileSystems."/mnt/nas/${account.username}" = {
    device = "//10.0.30.90/svenh";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [
        "${automount_opts},credentials=/home/${account.username}/.config/samba/credentials,uid=1000,gid=100"
      ];
  };
}

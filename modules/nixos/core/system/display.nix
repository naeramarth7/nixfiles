{ pkgs, ... }:
{
  # Dynamic monitor detection
  systemd.user.services.kanshi = {
    description = "kanhsi daemon";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kanshi}/bin/kanshi -c kanshi_config_file";
      Restart = "on-failure";
    };
  };
}

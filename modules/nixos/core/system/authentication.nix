{
  account,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    gnome-keyring
    libsecret
    seahorse
  ];

  services.dbus.packages = [ pkgs.gnome-keyring ];

  services.displayManager.gdm = {
    enable = true;
    wayland = true;

    settings = {
      daemon = {
        AutomaticLoginEnable = "True";
        AutomaticLogin = "${account.username}";
      };
    };
  };

  # gnome-keyring service
  services.gnome.gnome-keyring.enable = true;

  # allow auto-unlock of gnome-keyring (requires password match)
  security.pam.services = {
    login.enableGnomeKeyring = true;
    gdm.enableGnomeKeyring = true;
  };

  # Framework to let applications request elevated permissions
  security.polkit.enable = true;

  systemd = {
    # Allow apps to request authentication via system authentication service (gnome-keyring)
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # polkitPolicyOwners does not work via home manager, so this is added as on system level
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ account.username ];
  };
}

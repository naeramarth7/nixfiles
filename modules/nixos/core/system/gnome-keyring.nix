{ account, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    libsecret
    seahorse
  ];

  services.gnome.gnome-keyring.enable = true;

  # Allow auto-unlock of KDE Wallet via PAM (requires matching login password)
  security.pam.services.gdm.kwallet.enable = true;
  security.pam.services."${account.username}".kwallet.enable = true;

  # Framework to let applications request elevated permissions
  security.polkit.enable = true;

  # polkitPolicyOwners does not work via home manager, so this is added as on system level
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ account.username ];
  };

  # using hyprpolkitagent with hyprland
  # # Allow apps to request authentication via system authentication service (gnome-keyring)
  # systemd.user.services.polkit-gnome-authentication-agent-1 = {
  #   description = "polkit-gnome-authentication-agent-1";
  #   wantedBy = [ "graphical-session.target" ];
  #   wants = [ "graphical-session.target" ];
  #   after = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #     Restart = "on-failure";
  #     RestartSec = 1;
  #     TimeoutStopSec = 10;
  #   };
  # };
}

{
  account,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    libsecret
    kdePackages.kwallet
    kdePackages.kwalletmanager
  ];

  # Ensure the KDE wallet daemon is available on DBus
  services.dbus.packages = [ pkgs.kdePackages.kwallet ];

  # Use SDDM as the display manager (KDE-friendly)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    settings = {
      Autologin = {
        Session = "hyprland-uwsm.desktop";
        User = "${account.username}";
      };
    };
  };

  # Allow auto-unlock of KDE Wallet via PAM (requires matching login password)
  security.pam.services.login.kwallet.enable = true;
  security.pam.services.sddm.kwallet.enable = true;

  # Framework to let applications request elevated permissions
  security.polkit.enable = true;

  # polkitPolicyOwners does not work via home manager, so this is added as on system level
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ account.username ];
  };
}

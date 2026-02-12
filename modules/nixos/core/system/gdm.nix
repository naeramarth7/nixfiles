{
  account,
  ...
}:
{
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "${account.username}";
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

}

{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite

    # TODO
    mako
    swayidle
    swaylock
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    ELECTRON_ENABLE_WAYLAND = 1;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}

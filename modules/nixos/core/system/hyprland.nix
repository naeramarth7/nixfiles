{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.hyprland.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpolkitagent

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

{ pkgs, ... }:
{
  # system wide packages only

  environment.systemPackages = with pkgs; [
    nautilus
  ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      inter
      roboto
      roboto-flex
      roboto-mono
    ];
  };
}

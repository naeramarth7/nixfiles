{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nautilus
    todoist # cli
    todoist-electron
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

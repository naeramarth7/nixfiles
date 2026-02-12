{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mqttx
    mqttx-cli
  ];
}

{ ... }:
{
  services.syncthing.settings.folders = {
    "~/.sync/config" = {
      enable = true;
      devices = [ "xsh-nas-01" ];
      id = "fvpuj-tkxs3";
      label = "macOS configs";
      type = "sendreceive";
    };
  };
}

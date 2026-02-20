{ ... }:
{
  services.syncthing.settings.folders = {
    "~/Documents/Obsidian" = {
      enable = true;
      devices = [ "xsh-nas-01" ];
      id = "rdyho-dgcog";
      label = "Obsidian";
      type = "sendreceive";
    };
  };
}

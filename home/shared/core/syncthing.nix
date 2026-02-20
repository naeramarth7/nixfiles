_: {
  services.syncthing.enable = true;
  services.syncthing.settings.devices = {
    "xsh-nas-01" = {
      id = "2HVBMY4-FL3JLJU-JJ6FGWL-GD52G6R-URMR5IN-ZCIJC3T-J227O7U-QSSUQQL";
    };
  };
  services.syncthing.settings.folders = {
    "~/Documents/Obsidian" = {
      enable = true;
      devices = [ "xsh-nas-01" ];
      id = "rdyho-dgcog";
      label = "Obsidian";
      type = "sendreceive";
    };
  };
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

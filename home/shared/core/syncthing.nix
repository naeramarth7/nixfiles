_: {
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "xsh-nas-01" = {
          id = "2HVBMY4-FL3JLJU-JJ6FGWL-GD52G6R-URMR5IN-ZCIJC3T-J227O7U-QSSUQQL";
        };
        "svenh-pixel-10-pro" = {
          id = "S5XSQJJ-45DDZEW-VZMXWVQ-RSPWDLS-RN6G2C6-MPW3WFO-F7CPJJ5-QXE3SQU";
        };
      };
      folders = {
        "Obsidian" = {
          id = "rdyho-dgcog";
          path = "~/Documents/Obsidian";
          devices = [ "xsh-nas-01" ];
        };
      };
    };
  };
}

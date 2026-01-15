_: {
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "xsh-nas-01" = {
          id = "2HVBMY4-FL3JLJU-JJ6FGWL-GD52G6R-URMR5IN-ZCIJC3T-J227O7U-QSSUQQL";
        };
        "MB-HY34415F46" = {
          id = "TGOAP4U-V6SRRGP-TKRXHBB-7VJ2KUH-RPTZEBC-L53UANY-55ZPC4F-WW552QR";
        };
        "svenh-iphone13-mini" = {
          id = "Q4UEFWI-AEJCMOD-G5ECQZN-UNY6TFW-6GZFRQC-VW36Z5Z-PGFTRYD-FKDNPQ7";
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

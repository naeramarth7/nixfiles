{ config, ... }: {
  programs.aerospace = {
    enable = true;
    launchd.enable = true;
  };
}

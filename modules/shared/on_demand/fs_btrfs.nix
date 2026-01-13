_: {
  # Scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  # # Deduplication
  # services.beesd.filesystems = {
  #   root = {
  #     spec = "LABEL=root";
  #     hashTableSizeMB = 2048;
  #     verbosity = "crit";
  #     extraOptions = [
  #       "--loadavg-target"
  #       "5.0"
  #     ];
  #   };
  # };
}

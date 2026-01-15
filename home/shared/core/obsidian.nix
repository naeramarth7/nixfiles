{ config, lib, ... }:
{
  # seems to be missing on initial instalation
  home.activation.ensureDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${config.xdg.configHome}/obsidian
  '';

  # vaults are sync via syncthing
  programs.obsidian = {
    enable = true;
  };
}

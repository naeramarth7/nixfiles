{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    colima
    docker
    docker-compose
  ];

  launchd.agents.colima = {
    enable = true;
    config = {
      EnvironmentVariables.PATH = lib.makeBinPath [
        pkgs.colima
        pkgs.docker
        pkgs.coreutils
        "/usr"
      ] + ":/bin:/sbin";
      ProgramArguments = [
        (lib.getExe pkgs.colima)
        "start"
        "--foreground"
      ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardErrorPath = "${config.home.homeDirectory}/.tmp/colima.err.log";
      StandardOutPath = "${config.home.homeDirectory}/.tmp/colima.out.log";
    };
  };
}

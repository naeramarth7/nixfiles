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
      EnvironmentVariables.PATH = lib.makeBinPath ([ pkgs.docker ] ++ [ "/usr" ]);
      ProgramArguments = [
        (lib.getExe pkgs.colima)
        "start"
        "--foreground"
      ];
      RunAtLoad = true;
      KeepAlive = {
        Crashed = true;
        SuccessfulExit = false;
      };
      StandardErrorPath = "${config.home.homeDirectory}/.tmp/colima.err.log";
      StandardOutPath = "${config.home.homeDirectory}/.tmp/colima.out.log";
    };
  };
}

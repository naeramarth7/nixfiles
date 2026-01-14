{
  account,
  pkgs,
  config,
  ...
}:
{
  programs.zsh.enable = true;

  users.users.${account.username} = {
    name = "${account.username}";
    home = "/Users/${account.username}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    # use taps from nix-homebrew module
    taps = builtins.attrNames config.nix-homebrew.taps;
    caskArgs = {
      appdir = "/Users/${account.username}/Applications";
    };
    onActivation = {
      cleanup = "uninstall";
      # # Upgrade all outdated packages and casks.
      # # Makes the build not idempotent anymore, but brew packages are not managed by nix anyway.
      # upgrade = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${account.username} = {
      imports = [
        ../../../home/darwin/core
        ../../../home/darwin/work
      ];
      home = {
        stateVersion = "25.11";
      };
    };
  };
}

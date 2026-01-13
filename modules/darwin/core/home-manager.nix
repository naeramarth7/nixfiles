{
  user,
  pkgs,
  config,
  ...
}:
{
  programs.zsh.enable = true;

  users.users.${user.accountName} = {
    name = "${user.accountName}";
    home = "/Users/${user.accountName}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    # use taps from nix-homebrew module
    taps = builtins.attrNames config.nix-homebrew.taps;
    caskArgs = {
      appdir = "/Users/${user.accountName}/Applications";
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
    users.${user.accountName} = {
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

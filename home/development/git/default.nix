{ pkgs, ... }:
let
  paths = {
    allowedSigners = ".config/git/allowed-signers";
    config.personal = ".config/git/config.personal";
    config.work = ".config/git/config.work";
  };
in
{
  programs.git = {
    enable = true;

    settings = {
      include = {
        path = "~/.config/git/config.main";
      };
    };
  };

  imports = [
    ./gitconfig.nix
  ];

  home.file = {
    "${paths.allowedSigners}".source = ./allowed-signers;
    "${paths.config.personal}".source = ./gitconfig.personal;
    "${paths.config.work}".source = ./gitconfig.work;
  };

  home.packages = [
    pkgs.diff-so-fancy
    pkgs.git-recent
  ];
}

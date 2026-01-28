{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      include = {
        # via dotfiles
        path = "~/.config/git/config.main";
      };
    };
  };

  home.packages = [
    pkgs.diff-so-fancy
    pkgs.git-lfs
    pkgs.git-recent
  ];
}

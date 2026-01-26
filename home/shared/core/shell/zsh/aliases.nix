_: {
  programs.zsh.shellAliases = {
    g = "git";
    ls = "ls --color=auto -h";
    reload = "exec zsh";
    watch = "watch "; # allow aliases after watch
  };
}

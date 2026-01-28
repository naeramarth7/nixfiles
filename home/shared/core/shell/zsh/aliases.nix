_: {
  programs.zsh.shellAliases = {
    l = "ls -l";
    ll = "ls -la";
    g = "git";
    ls = "ls --color=auto -h";
    reload = "exec zsh";
    watch = "watch "; # allow aliases after watch

    # List all open windows and focus the selected one
    ff = "aerospace list-windows --all | fzf | cut -d'|' -f1 | xargs aerospace focus --window-id";
  };
}

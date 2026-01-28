{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    envExtra = "";
    completionInit = ""; # done manually to ensure plugins are loaded first
    initContent =
      let
        zshEarlyInit = lib.mkOrder 500 ''
          [ -f "$HOME/.zsh/0500-zsh.src" ] && source $HOME/.zsh/0500-zsh.src
        '';
        zshBeforeCompInit = lib.mkOrder 550 ''
          [ -f "$HOME/.zsh/0550-zsh.src" ] && source $HOME/.zsh/0550-zsh.src
        '';
        zshConfig = lib.mkOrder 1000 ''
          [ -f "$HOME/.zsh/1000-zsh.src" ] && source $HOME/.zsh/1000-zsh.src
        '';
        zshAfter = lib.mkOrder 1500 ''
          [ -f "$HOME/.zsh/1500-zsh.src" ] && source $HOME/.zsh/1500-zsh.src
        '';
      in
      lib.mkMerge [
        zshEarlyInit
        zshBeforeCompInit
        zshConfig
        zshAfter
      ];
  };

  programs.zsh.antidote = {
    enable = true;
    plugins = [
      "romkatv/zsh-bench kind:path" # zsh benchmarking tool

      # set up Zsh completions with plugins
      "Aloxaf/fzf-tab"
      "zsh-users/zsh-completions kind:fpath path:src"

      # history
      "zsh-users/zsh-autosuggestions"
      "zsh-users/zsh-history-substring-search"

      "zdharma-continuum/fast-syntax-highlighting kind:defer"

      # "getantidote/use-omz" # allow using omz plugins with antidote
    ];
  };
}

{ lib, ... }:
{
  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    initContent =
      let
        zshEarlyInit = lib.mkOrder 500 "";
        zshBeforeCompInit = lib.mkOrder 550 ''
          # Available completion styles: gremlin, ohmy, prez, zshzoo
          zstyle ':plugin:ez-compinit' 'compstyle' 'prez'
        '';
        zshConfig = lib.mkOrder 1000 "";
        zshAfter = lib.mkOrder 1500 ''
          set -o emacs
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
      "mattmc3/ez-compinit" # also needs init in zshBeforeCompInit
      "zsh-users/zsh-completions kind:fpath path:src"

      # history
      "zsh-users/zsh-autosuggestions"
      "zsh-users/zsh-history-substring-search"

      "zdharma-continuum/fast-syntax-highlighting kind:defer"

      # "getantidote/use-omz" # allow using omz plugins with antidote
    ];
  };
}

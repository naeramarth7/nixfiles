{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
      ripgrep # https://github.com/BurntSushi/ripgrep
      fd # https://github.com/sharkdp/fd

      tree-sitter

      # compilers / tools needed by tree-sitter, mason, etc.
      gcc
      cargo

      ####################
      # Language support #
      ####################

      # lua
      lua-language-server
      stylua

      # typescript
      typescript-language-server
      vscode-js-debug

      # nix
      nixd
      nixfmt
    ];
}

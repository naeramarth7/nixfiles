{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep # https://github.com/BurntSushi/ripgrep
      fd # https://github.com/sharkdp/fd

      tree-sitter
      gcc # treesitter needs this for compile parsers
    ];
  };

  home.packages = with pkgs; [
  ];
}

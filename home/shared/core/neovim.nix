{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep # https://github.com/BurntSushi/ripgrep
      fd # https://github.com/sharkdp/fd

      # lua
      lua-language-server
      stylua
    ];
  };
}

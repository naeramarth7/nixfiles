{ ... }: {
  # gets automatically integrated into shells without extra config
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
    };
  };
}

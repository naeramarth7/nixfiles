{ ... }:
{
  # gets automatically integrated into nushell
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
    };
  };
}

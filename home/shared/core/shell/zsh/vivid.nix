{ ... }:
let
  vividTheme = "ayu";
in
{
  programs.vivid.enable = true;
  programs.vivid.enableZshIntegration = true;
  programs.vivid.activeTheme = vividTheme;
}

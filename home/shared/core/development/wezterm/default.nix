{ pkgs, ... }:
let
  defaultProg =
    if pkgs.stdenv.isDarwin then
      ''{ "/bin/zsh", "-lc", "${pkgs.nushell}/bin/nu" }''
    else
      ''{ "${pkgs.nushell}/bin/nu", "-l" }'';
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require 'wezterm'

      -- This will hold the configuration.
      local config = wezterm.config_builder()

      -- Default shell
      config.default_prog = ${defaultProg}

      -- For example, changing the initial geometry for new windows:
      config.initial_cols = 120
      config.initial_rows = 28

      -- or, changing the font size and color scheme.
      config.font_size = 12
      config.color_scheme = 'ayu'

      -- Font
      config.font = wezterm.font 'Roboto Mono'
      config.freetype_load_target = 'Light'
      config.use_resize_increments = true -- improves font rendering

      -- Tabs
      config.use_fancy_tab_bar = false

      -- Finally, return the configuration to wezterm:
      return config
    '';
  };
}

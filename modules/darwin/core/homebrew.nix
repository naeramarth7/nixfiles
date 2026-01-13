{ ... }:
{
  homebrew.brews = [
    # Tools
    "chezmoi" # dotfiles management. Might be completely replaced by nix later.

    # Development
    "cmctl" # cert manager cli
    {
      # container runtimes on macOS
      name = "colima";
      start_service = true;
      restart_service = "changed";
    }
    "docker"
    "docker-compose"
    "skhd" # hotkey daemon
  ];

  homebrew.casks = [
    # Internet
    # "firefox"

    # Productivity
    "alfred"
    "iterm2"
    "obsidian"
    "phoenix"
    "todoist-app"

    # Development
    "visual-studio-code"
    "wezterm"

    # Social
    "vesktop"
    "whatsapp"

    # Tools
    {
      name = "1password";
      args = {
        appdir = "/Applications";
      };
    }
    "1password-cli"
    "appcleaner"
    "bettertouchtool"
    "cyberduck"
    "jordanbaird-ice"
    "keka"
    "krisp"
    "mqtt-explorer"
    "scroll-reverser"
    "shottr"
    "tunnelblick"

    # Media
    "spotify"
    "vlc"

    # Misc
    "home-assistant"
    "moneymoney"
    "portfolioperformance"

    # Fonts
    "font-inter"
    "font-roboto"
    "font-roboto-flex"
    "font-roboto-mono"
  ];
}

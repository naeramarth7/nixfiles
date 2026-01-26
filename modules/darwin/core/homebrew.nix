_: {
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
    # This is the actual version used on macOS instead of the nixpkg one.
    # See comments on nixpkg for background.
    "firefox"

    # Productivity
    "alfred"
    "iterm2"
    "phoenix"
    "todoist-app"

    # Social
    "vesktop"
    "whatsapp"

    # Tools
    "appcleaner"
    "bettertouchtool"
    "cyberduck"
    "handbrake"
    "jordanbaird-ice"
    "karabiner-elements"
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
  ];
}

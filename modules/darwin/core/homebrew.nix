{ account, config, ... }:
{
  homebrew = {
    enable = true;
    # use taps from nix-homebrew module
    taps = builtins.attrNames config.nix-homebrew.taps;
    caskArgs = {
      appdir = "/Users/${account.username}/Applications";
    };
    onActivation = {
      cleanup = "uninstall";
      # Upgrade all outdated packages and casks.
      # Makes the build not idempotent anymore, but brew packages are not managed by nix anyway.
      upgrade = true;
    };
  };

  homebrew.casks = [
    # Internet
    # This is the actual version used on macOS instead of the nixpkg one.
    # See comments on nixpkg for background.
    "firefox"

    # Productivity
    "alfred"
    "todoist-app"

    # Social
    "vesktop"
    "whatsapp"

    # Tools
    "appcleaner"
    "bettertouchtool"
    "cyberduck"
    "handbrake"
    "karabiner-elements"
    "keka"
    "krisp"
    "mqtt-explorer"
    "scroll-reverser"
    "shottr"
    "tunnelblick"

    # Media
    "vlc"

    # Misc
    "home-assistant"
    "moneymoney"
    "portfolioperformance"
  ];
}

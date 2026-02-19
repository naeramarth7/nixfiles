# https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # need to manually run pywalfox once after install
    pywalfox-native # sync noctalia theme with firefox
  ];

  programs.firefox = {
    enable = true;

    # This doesn't play nice with 1Password on macOS unless it's signed by apple.
    # We add it just for the config, but skip installing the package and use the brew version.
    package = if pkgs.stdenv.isDarwin then null else pkgs.firefox;

    policies = {

      # ---- POLICIES ----
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab";
      SearchBar = "unified"; # alternative: "separate"

      # ---- EXTENSIONS ----
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        # 1Password:
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };

        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };

      # ---- PREFERENCES ----
      # Check about:config for options.
      Preferences = {
        "browser.contentblocking.category" = {
          Value = "standard";
          Status = "locked";
        };
        "browser.formfill.enable" = {
          Value = false;
          Status = "locked";
        };
        "browser.search.suggest.enabled" = {
          Value = true;
          Status = "locked";
        };
        "browser.search.suggest.enabled.private" = {
          Value = true;
          Status = "locked";
        };
        "browser.urlbar.suggest.searches" = {
          Value = true;
          Status = "locked";
        };
        "browser.urlbar.showSearchSuggestionsFirst" = {
          Value = false;
          Status = "locked";
        };
        "browser.startup.page" = {
          Value = 3; # 3 = open previous tabs
          Status = "locked";
        };

        # not yet supported

        "browser.taskbarTabs.enabled" = {
          Value = true;
          Status = "locked";
        };
        "sidebar.verticalTabs" = {
          Value = true;
        };
      };
    };
  };
}

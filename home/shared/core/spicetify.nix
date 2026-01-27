{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  platformConfig = if ! pkgs.stdenv.isDarwin then {
    wayland = true;
  } else { };
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  home.packages = with pkgs; [
    pkgs.spicetify-cli
  ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      # hidePodcasts
      # shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      # newReleases
    ];

    enabledSnippets = with spicePkgs.snippets; [
    ];

    # theme applied by noctalia
    theme = spicePkgs.themes.sleek;
    colorScheme = "AyuDark";
  } // platformConfig;
}

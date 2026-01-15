{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
    wayland = true;

    enabledExtensions = with spicePkgs.extensions; [
      # adblockify
      # hidePodcasts
      # shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      # newReleases
    ];

    # theme applied by noctalia
    theme = spicePkgs.themes.sleek;
    colorScheme = "AyuDark";
  };

}

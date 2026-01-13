{ pkgs, inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;

      wayland = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
      ];

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
        newReleases
      ];

      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "mocha";
    };

}

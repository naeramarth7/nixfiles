_: {
  imports = [
    ./system
    ./applications.nix
    ./networking.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    # whatsie depends on an insecure version of qtwebengine
    "qtwebengine-5.15.19"
  ];
}

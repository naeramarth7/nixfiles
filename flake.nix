{
  description = "xsh NixOS flake";

  nixConfig.extra-experimental-features = "nix-command flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snappy-switcher = {
      url = "github:OpalAayan/snappy-switcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    /**
      Darwin specific
    */

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    ### TEMP
    koekeishiya-formulae = {
      url = "github:koekeishiya/homebrew-formulae";
      flake = false;
    };
    shinokada-consize = {
      url = "github:shinokada/homebrew-consize";
      flake = false;
    };
    utkuozdemir-pv-migrate = {
      url = "github:utkuozdemir/homebrew-pv-migrate";
      flake = false;
    };
    weaveworks-tap = {
      url = "github:weaveworks/homebrew-tap";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,

      nixpkgs,
      nixpkgs-stable,
      home-manager,
      noctalia,
      nix-vscode-extensions,
      spicetify-nix,

      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-bundle,
      homebrew-cask,

      ...
    }:
    let
      customOverlays = import ./overlays;
      defaultAccount = {
        username = "svenh";
        fullName = "Sven Herrle";
      };
      linuxSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      darwinSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      mkApp = scriptName: system: {
        type = "app";
        program = "${
          (nixpkgs.legacyPackages.${system}.writeScriptBin scriptName ''
            #!/usr/bin/env bash
            PATH=${nixpkgs.legacyPackages.${system}.git}/bin:$PATH
            echo "Running ${scriptName} for ${system}"
            exec ${self}/apps/${system}/${scriptName} "$@"
          '')
        }/bin/${scriptName}";
      };
      mkLinuxApps = system: {
        "build-switch" = mkApp "build-switch" system;
        # "build-switch-emacs" = mkApp "build-switch-emacs" system;
        # "clean" = mkApp "clean" system;
        # "copy-keys" = mkApp "copy-keys" system;
        # "create-keys" = mkApp "create-keys" system;
        # "check-keys" = mkApp "check-keys" system;
        # "install" = mkApp "install" system;
        # "install-with-secrets" = mkApp "install-with-secrets" system;
      };
      mkDarwinApps = system: {
        "build" = mkApp "build" system;
        "build-switch" = mkApp "build-switch" system;
        # "clean" = mkApp "clean" system;
        # "copy-keys" = mkApp "copy-keys" system;
        # "create-keys" = mkApp "create-keys" system;
        # "check-keys" = mkApp "check-keys" system;
        # "rollback" = mkApp "rollback" system;
      };
      commonModules = [
        (
          { ... }:
          {
            nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ] ++ customOverlays;
          }
        )
      ];
      mkNixosConfig =
        system: account: hostPath:
        (nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs account;

            pkgs-stable = import inputs.nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
          };

          modules = commonModules ++ [
            ./hosts/nixos
            hostPath

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs account;

                  pkgs-stable = import inputs.nixpkgs-stable {
                    inherit system;
                    config.allowUnfree = true;
                  };
                };

                useGlobalPkgs = true;
                useUserPackages = true;

                users.${account.username} = import ./home/nixos;
              };
            }
          ];
        });
      mkDarwinConfig =
        system: account:
        (nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit inputs account;

            pkgs-stable = import inputs.nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = commonModules ++ [
            ./hosts/darwin

            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs account;

                  pkgs-stable = import inputs.nixpkgs-stable {
                    inherit system;
                    config.allowUnfree = true;
                  };
                };

                useGlobalPkgs = true;
                useUserPackages = true;

                users.${account.username} = {
                  imports = [
                    ./home/darwin/core
                    ./home/darwin/work
                  ];
                  home.stateVersion = "25.11";
                };
              };
            }

            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                user = account.username;
                enable = true;
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-bundle" = homebrew-bundle;

                  # TEMP
                  "koekeishiya/homebrew-formulae" = inputs.koekeishiya-formulae;
                  "shinokada/homebrew-consize" = inputs.shinokada-consize;
                  "utkuozdemir/homebrew-pv-migrate" = inputs.utkuozdemir-pv-migrate;
                  "weaveworks/homebrew-tap" = inputs.weaveworks-tap;
                };
                mutableTaps = false;
                autoMigrate = true;
              };
            }
          ];
        });
    in
    {
      apps =
        nixpkgs.lib.genAttrs linuxSystems mkLinuxApps // nixpkgs.lib.genAttrs darwinSystems mkDarwinApps;

      nixosConfigurations =
        # Host-specific configurations
        {
          xsh-workstation-nix-01 = mkNixosConfig "x86_64-linux" defaultAccount ./hosts/nixos/xsh-workstation-nix-01;
        };

      darwinConfigurations = {
        # Host-specific configurations only
        "MB-HY34415F46" = mkDarwinConfig "aarch64-darwin" (defaultAccount // { username = "sven.herrle"; });
        "MB-K77H417Q2L" = mkDarwinConfig "aarch64-darwin" (defaultAccount // { username = "sven.herrle"; });
      };
    };

}

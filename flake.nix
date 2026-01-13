{
  description = "xsh NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

    /**
      Darwin specific
    */

    darwin = {
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
      home-manager,
      noctalia,
      nix-vscode-extensions,
      spicetify-nix,

      darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-bundle,
      homebrew-cask,
      ...
    }:
    let
      user = {
        accountName = "sven.herrle";
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
      mkNixosConfig =
        user: hostPath:
        (nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs user; };

          modules = [
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];
              }
            )

            ./hosts/nixos/default.nix
            hostPath

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.${user.accountName} = import ./home/nixos;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        });
      mkDarwinConfig =
        user: system:
        (darwin.lib.darwinSystem {
          inherit system;
          specialArgs = { inherit inputs user; };
          modules = [
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                user = user.accountName; # overriden on host level
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
            ./hosts/darwin
          ];
        });
    in
    {
      apps =
        nixpkgs.lib.genAttrs linuxSystems mkLinuxApps // nixpkgs.lib.genAttrs darwinSystems mkDarwinApps;

      nixosConfigurations =
        # TODO
        (nixpkgs.lib.genAttrs linuxSystems (system: mkNixosConfig user ./hosts/xsh-workstation-nix-01.nix))
        # Host-specific configurations
        // {
          xsh-workstation-nix-01 = mkNixosConfig user ./hosts/xsh-workstation-nix-01.nix;
        };

      darwinConfigurations =
        (nixpkgs.lib.genAttrs darwinSystems (system: mkDarwinConfig user system))
        # Named host configurations
        // {
          MB-HY34415F46 = mkDarwinConfig (user // { accountName = "sven.herrle"; }) "aarch64-darwin";
        };
    };

}

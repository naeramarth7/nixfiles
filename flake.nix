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
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      noctalia,
      nix-vscode-extensions,
      spicetify-nix,
      ...
    }:
    {
      nixosConfigurations = {
        xsh-workstation-nix-01 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };

          modules = [
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];
              }
            )

            ./hosts/xsh-workstation-nix-01.nix
            ./configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.svenh = import ./home;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };

        MB-HY34415F46 = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin"; # or x86_64-darwin
            overlays = [ nix-vscode-extensions.overlays.default ];
          };

          extraSpecialArgs = { inherit inputs; };

          modules = [
            ./home
            {
              home.username = "svenh";
              home.homeDirectory = "/Users/sven.herrle";
            }
          ];
        };
      };
    };
}

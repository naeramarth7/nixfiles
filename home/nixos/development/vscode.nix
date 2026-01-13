{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = (
      pkgs.vscode.override {
        commandLineArgs = "--password-store='gnome-libsecret'";
      }
    );

    profiles.default.extensions =
      with pkgs.open-vsx;
      [
        # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/open-vsx-latest.json

        # language support
        jnoortheen.nix-ide

        # misc
        christian-kohler.path-intellisense

        # themes
        # noctalia.noctaliatheme

      ]
      ++ (with pkgs.vscode-marketplace; [
        # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/vscode-marketplace-latest.json

        # language support
        kdl-org.kdl

        # AI
        # Disabled as they required the newest version of vscode / vscodium
        # nixpkpgs is a bit slow though
        # github.copilot
        # github.copilot-chat
      ]);
  };

}

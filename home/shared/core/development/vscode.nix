{ pkgs, ... }:
let
  # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/open-vsx-latest.json
  # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/vscode-marketplace-latest.json
  extensions = {
    default = with pkgs.vscode-marketplace; [
      # nix
      jnoortheen.nix-ide

      # typescript / javascript
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      oouo-diogo-perdigao.docthis
      orta.vscode-jest
      yoavbls.pretty-ts-errors

      # markdown
      bierner.markdown-mermaid
      bpruitt-goddard.mermaid-markdown-syntax-highlighting
      davidanson.vscode-markdownlint
      fcrespo82.markdown-table-formatter
      jayfidev.tablegenerator
      shd101wyy.markdown-preview-enhanced
      tomoyukim.vscode-mermaid-editor
      yzhang.markdown-all-in-one

      # dart / flutter
      dart-code.dart-code
      dart-code.flutter

      # C# / .NET
      ms-dotnettools.csdevkit
      ms-dotnettools.csharp
      ms-dotnettools.vscode-dotnet-runtime

      # other languages
      dotjoshjohnson.xml
      jebbs.plantuml
      jock.svg
      kdl-org.kdl # niri
      mrmlnc.vscode-json5
      redhat.vscode-yaml
      romantomjak.go-template
      tamasfe.even-better-toml

      # tools
      bierner.color-info
      chdsbd.github-code-owners
      christian-kohler.path-intellisense
      compulim.compulim-vscode-closetag
      eamodio.gitlens
      editorconfig.editorconfig
      formulahendry.auto-rename-tag
      hverlin.mise-vscode
      jrebocho.vscode-random
      naumovs.color-highlight
      signageos.signageos-vscode-sops
      sleistner.vscode-fileutils
      tyriar.sort-lines
      usernamehw.errorlens
      vincaslt.highlight-matching-tag
      wayou.vscode-todo-highlight

      # Versions from nix-vscode-extensions expect insider builds
      # github.copilot
      # github.copilot-chat
    ];
    linux = with pkgs.vscode-marketplace; [

    ];
    darwin = with pkgs.vscode-marketplace; [
      # tools
      dnicolson.binary-plist

      # themes
      teabyii.ayu
    ];
  };
in
{
  programs.vscode = {
    enable = true;
    package = (
      pkgs.vscode.override {
        commandLineArgs = "--password-store='gnome-libsecret'";
      }
    );

    profiles.default.extensions =
      extensions.default ++ (if pkgs.stdenv.isDarwin then extensions.darwin else extensions.linux);
  };

}

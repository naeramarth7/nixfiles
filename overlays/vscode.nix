final: prev:
let
  inherit (prev.stdenv.hostPlatform) system;
  version = "1.109.5";

  archive_fmt = if prev.stdenv.hostPlatform.isDarwin then "zip" else "tar.gz";
  plat =
    {
      x86_64-linux = "linux-x64";
      x86_64-darwin = "darwin";
      aarch64-linux = "linux-arm64";
      aarch64-darwin = "darwin-arm64";
      armv7l-linux = "linux-armhf";
    }
    .${system} or (throw "Unsupported system: ${system}");
  hash =
    {
      x86_64-linux = "sha256-cBYBA8DdpQ9lGjfuJ6ZammSmk4c0zxoLzUnYNhK9sac=";
      aarch64-linux = "sha256-nncqNGnODOgu66jp7ok/spblLSl0iZ1lPJqrkSDncIA=";
      x86_64-darwin = "sha256-84PnRIUTfsf4T36GkgNaeaKAcz0Ul/BsP6Sd93G/F2g=";
      aarch64-darwin = "sha256-ckwFJ4P2hCy7TTUS+peUNad00ydk4RnAthkggrbYzAQ=";
      armv7l-linux = "sha256-I5Phy1eY+oYAVBklvtUldkYbmgJUYCBr7hAGIxnNTvA=";
    }
    .${system} or (throw "No sha256 available for ${system}.");
in
{
  vscode = prev.vscode.overrideAttrs (old: {
    inherit version;
    rev = "072586267e68ece9a47aa43f8c108e0dcbf44622";

    src = prev.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit hash;
    };
  });
}

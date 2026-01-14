final: prev:
let
  inherit (prev.stdenv.hostPlatform) system;
  version = "@@VERSION@@";

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
      x86_64-linux = "sha256-qaGeIN0Jxh7Br31n2d7CRVAE0PvTUSD+HSRYjBI/lHQ=";
      aarch64-linux = "sha256-x/jWXwVheVQlAtg2VOWeDU3xR2DpnHChIT1SgVIRCK0=";
      x86_64-darwin = "sha256-yTJtE5YWkV1VFFnMxPLJOJjFjc2JNwZgfCIkp4jPHjs=";
      aarch64-darwin = "sha256-ZbpP5xiytB6NOinmVcqbAaLcwDQqJ6m/8pAtl+/ib2A=";
      armv7l-linux = "sha256-oZ1vRGWBVSAuf+4qHTVzaH8XFGisijtDy2tL8bCoqUA=";
    }
    .${system} or (throw "No sha256 available for ${system}.");
in
{
  vscode = prev.vscode.overrideAttrs (old: {
    inherit version;
    rev = "@@REV@@";

    src = prev.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit hash;
    };
  });
}

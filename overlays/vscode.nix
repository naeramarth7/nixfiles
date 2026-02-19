final: prev:
let
  inherit (prev.stdenv.hostPlatform) system;
  version = "1.109.4";

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
      x86_64-linux = "sha256-6zmuYl34QMG3W5h/gCfiW9atK4CpdoQJvttw6y4sy9Q=";
      aarch64-linux = "sha256-Cz7mjcm0HcoRK5EA5xi9AHOxbiEOt9JL+Drfd6/tYBw=";
      x86_64-darwin = "sha256-0TD+ez+/jc6nZEoZO3j467ouMbmnek6iQQ6SMo57oL0=";
      aarch64-darwin = "sha256-8Rfjr8WShCwrJlJapkALNPubPVBpKGZRtHKtTi5Xslc=";
      armv7l-linux = "sha256-eUvAvFIP8/5KIIyZFD6VY6RBR97kus6PFb7Inxgh30A=";
    }
    .${system} or (throw "No sha256 available for ${system}.");
in
{
  vscode = prev.vscode.overrideAttrs (old: {
    inherit version;
    rev = "c3a26841a84f20dfe0850d0a5a9bd01da4f003ea";

    src = prev.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit hash;
    };
  });
}

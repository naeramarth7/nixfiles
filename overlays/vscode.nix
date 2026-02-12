final: prev:
let
  inherit (prev.stdenv.hostPlatform) system;
  version = "1.109.2";

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
      x86_64-linux = "sha256-ST5i8gvNtAaBbmcpcg9GJipr8e5d0A0qbdG1P9QViek=";
      aarch64-linux = "sha256-7plpHWoi8eYDKQZVV3OCXZJUk8j173M1xpRgTOTsPZ0=";
      x86_64-darwin = "sha256-BRGXLasiHZSKsijq02bCa2RbaBc7iC1ZtLe29u4KTH0=";
      aarch64-darwin = "sha256-RgfhGjVFmaIAAotTYNPUDrJZ8qj8e4yR9bVfal/Hl6o=";
      armv7l-linux = "sha256-Zzz4HsmiWcKiBRE19pGll8BRQy26wbmpuYSi89PDoBo=";
    }
    .${system} or (throw "No sha256 available for ${system}.");
in
{
  vscode = prev.vscode.overrideAttrs (old: {
    inherit version;
    rev = "591199df409fbf59b4b52d5ad4ee0470152a9b31";

    src = prev.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit hash;
    };
  });
}

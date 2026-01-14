final: prev:
let
  inherit (prev.stdenv.hostPlatform) system;
  version = "1.108.1";

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
      x86_64-linux = "sha256-qYthiZlioD6fWCyDPfg7Yfo5PqCHzcenk8NjgobLW7c=";
      aarch64-linux = "sha256-7DBRwwdQm06nyxRMR3wOH+4DqlnPvXGL/rMdq7jpxTw=";
      x86_64-darwin = "sha256-zwvdrstg6UtoG8EE87VXjDORT3zEbbKCFdAP0wPsD9s=";
      aarch64-darwin = "sha256-YXmTzpsRSwdtbmoQLDRcJ5hcDURZnrkh5p8e8rYnA0Y=";
      armv7l-linux = "sha256-VQ4/Ae4qeZYCFAJcTh8h8BWM15u8QEAfyJpkFx+1Xc8=";
    }
    .${system} or (throw "No sha256 available for ${system}.");
in
{
  vscode = prev.vscode.overrideAttrs (old: {
    inherit version;
    rev = "1.108.1";

    src = prev.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit hash;
    };
  });
}

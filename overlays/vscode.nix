final: prev:
let
  inherit (prev.stdenv.hostPlatform) system;
  version = "1.108.2";

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
      x86_64-linux = "sha256-RqBae6s6y2XnXqtKbrKkMRwALKLfNE7mBFwOwwomG10=";
      aarch64-linux = "sha256-8WigXl83hXEA7qsG6dOYKVSVISRDDpqJyv7L+9ks40Q=";
      x86_64-darwin = "sha256-3N7xZIJsgQPX6izaH8ZoXy3SLcbXCNwJvE8ahFwVfF8=";
      aarch64-darwin = "sha256-ZJ0QKqkFQYz3V7TEalM3sFJnqYnKBgQVqPXdsi2c+80=";
      armv7l-linux = "sha256-m78hRkaI1nlqdeeP3t0HiNCUzNneMXxyenC8RmtuC68=";
    }
    .${system} or (throw "No sha256 available for ${system}.");
in
{
  vscode = prev.vscode.overrideAttrs (old: {
    inherit version;
    rev = "c9d77990917f3102ada88be140d28b038d1dd7c7";

    src = prev.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit hash;
    };
  });
}

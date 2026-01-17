# stable openrgb does not support RTX 5080 FE
final: prev: {
  openrgb = prev.openrgb.overrideAttrs (old: {
    src = final.fetchFromGitLab {
      owner = "CalcProgrammer1";
      repo = "OpenRGB";
      rev = "ac00a8f36f3053d75cc2f483474e594666692ff3"; # 2026-01-16
      hash = "sha256-tux2lrSDlSjWAqUzkgWbqwhQFxhX5s7Y2UcPYzWrmOY=";
    };
    patches = [ ];
  });
}

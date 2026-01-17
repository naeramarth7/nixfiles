self: super: {
  unigine-heaven = super.unigine-heaven.overrideAttrs (old: rec {
    version = "4.0";
    src = super.fetchurl {
      url = "https://assets.unigine.com/d/Unigine_Heaven-${version}.run";
      sha256 = "15z3v2ad84wm37pphqk162dwcz0a5i46p4zs5dy1sqnmxmfjxnsj";
    };
  });

  unigine-valley = super.unigine-valley.overrideAttrs (old: rec {
    version = "1.0";
    src = super.fetchurl {
      url = "https://assets.unigine.com/d/Unigine_Valley-${version}.run";
      sha256 = "1vypzxlmh5c4d29xd0fxwhaqnbc56a2m55dyig2b8v6h8nf7md1g";
    };
  });
}

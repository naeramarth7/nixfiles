{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      inter
      roboto
      roboto-flex
      roboto-mono
    ];
  };
}

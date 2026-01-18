{ ... }:
{
  console.keyMap = "us";

  services.xserver.xkb = {
    layout = "us";
    variant = "de_se_fi";
    options = "caps:escape";
  };
}

{ pkgs, ... }:
{
  system.packages = with pkgs; [
    # compression tools
    bzip2
    gnutar
    gzip
    lha
    p7zip
    rar
    unrar
    unzip
    zip
  ];
}

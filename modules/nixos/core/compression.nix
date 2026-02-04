{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bzip2
    gnutar
    gzip
    p7zip
    rar
    unrar
    unzip
    zip
  ];
}

{ pkgs, ... }:
{
  imports = [
    ./ghostty
    ./git
    ./k8s
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    fluxcd
    fzf # fuzzy finder - also allows selection in lists such as kubens or kubectx
    gitleaks
    gnupg
    go-task
    htop
    jq
    neofetch
    nixfmt # nix formatter
    nixd # nix language server
    velero # backup tool for kubernetes
    yq
    zoxide
  ];

}

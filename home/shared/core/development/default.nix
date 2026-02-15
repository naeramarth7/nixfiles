{ pkgs, ... }:
{
  imports = [
    ./ghostty
    ./git
    ./k9s
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
    k3sup
    # kubeconform
    kubectl
    kubectx
    kubelogin
    kubernetes-helm
    # kustomize
    neofetch
    nixfmt # nix formatter
    nixd # nix language server
    velero # backup tool for kubernetes
    yq
    zoxide
  ];

}

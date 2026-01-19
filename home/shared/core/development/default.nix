{ pkgs, ... }:
{
  imports = [
    ./git
    ./vscode.nix
    ./wezterm
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
    k9s
    # kubeconform
    kubectl
    kubectx
    kubelogin
    kubernetes-helm
    # kustomize
    mise
    neofetch
    nixfmt # nix formatter
    nixd # nix language server
    velero # backup tool for kubernetes
    yq
    zoxide
  ];

}

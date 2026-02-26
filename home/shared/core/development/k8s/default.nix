{ pkgs, ... }:
{
  imports = [
    ./k9s.nix
  ];

  home.packages = with pkgs; [
    k3sup
    kubeconform
    kubectl
    kubectx
    kubelogin
    kubernetes-helm
    kustomize
  ];
}


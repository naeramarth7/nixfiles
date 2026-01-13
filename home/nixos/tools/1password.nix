{ user, pkgs, ... }:
let
  # onePassPath = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  onePassPath = "~/.1password/agent.sock";
in
{

  # home.packages = with pkgs; [
  #   _1password-cli
  #   _1password-gui
  # ];

  # Does not seem to work via home manager
  #
  # Allow communication between 1Password and browser extensions
  # nixpkgs = {
  #   overlays = [
  #     (final: prev: {
  #       _1password-gui = prev._1password-gui.override {
  #         polkitPolicyOwners = [ user.accountName ];
  #       };
  #     })
  #   ];
  # };

  # Set 1Password as ssh agent
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };

  # services.polkit-gnome.enable = true;
}

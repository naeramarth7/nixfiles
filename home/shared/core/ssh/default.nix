{ pkgs, ... }:
let
  includes = [
    "config.d/*"
  ]
  ++ (if pkgs.stdenv.isDarwin then [ "/Users/sven.herrle/.colima/ssh_config" ] else [ ]);
  identityAgent =
    if pkgs.stdenv.isDarwin then
      "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\""
    else
      "~/.1password/agent.sock";
in
{
  programs.ssh.enable = true;
  programs.ssh.enableDefaultConfig = false;
  programs.ssh.includes = includes;
  programs.ssh.matchBlocks."*".extraOptions.IdentityAgent = identityAgent;
  programs.ssh.matchBlocks."*".extraOptions.IgnoreUnknown =
    "gssapikexalgorithms,gssapiauthentication,gssapidelegatecredentials";
}

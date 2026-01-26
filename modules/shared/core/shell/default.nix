{ account, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableGlobalCompInit = false;
  };

  users.users.${account.username} = {
    shell = pkgs.zsh;
  };

  environment.variables = {
    __ETC_ZSHRC_SOURCED = "1";
  };
}

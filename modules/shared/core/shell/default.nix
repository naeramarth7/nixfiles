{ account, pkgs, ... }:
{
  users.users.${account.username} = {
    shell = pkgs.zsh;
  };
}

{ account, pkgs, ... }:
{
  users.users.${account.username} = {
    shell = pkgs.nushell;
  };
}

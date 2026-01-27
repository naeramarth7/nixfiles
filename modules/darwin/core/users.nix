{
  account,
  config,
  ...
}:
{
  users.users.${account.username} = {
    name = "${account.username}";
    home = "/Users/${account.username}";
    isHidden = false;
  };
}

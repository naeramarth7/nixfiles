{ user, ... }:
{
  imports = [
    ../../modules/darwin/core
    ../../modules/darwin/work
  ];

  system = {
    primaryUser = user.accountName;
    stateVersion = 6;
  };
}

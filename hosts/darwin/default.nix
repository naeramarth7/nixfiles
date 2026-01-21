{ account, ... }:
{
  imports = [
    ../../modules/darwin/core
    ../../modules/darwin/work
  ];

  system = {
    primaryUser = account.username;
    stateVersion = 6;
  };

  environment.variables = {
    EDITOR = "vim";
  };
}

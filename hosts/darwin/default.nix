{ account, ... }:
{
  imports = [
    ../../modules/darwin/core
    ../../modules/darwin/work
  ];

  system = {
    primaryUser = account.username;
  };

  environment.variables = {
    EDITOR = "vim";
  };
}

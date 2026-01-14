# via
# https://discourse.nixos.org/t/how-do-you-declare-your-pwa-s/40601/7
# https://github.com/bitbloxhub/nixos-config/blob/e2d4683c835fec608a2b5553a1addb937e09ed94/modules/firefox/taskbartabs.nix
_:
let
  taskbartabs = [
    {
      id = "2c06b669-778b-41e1-96ff-9eaff6224af7";
      scopes = [ { hostname = "https://web.whatsapp.com/"; } ];
      startUrl = "https://web.whatsapp.com";
      userContextId = 0;
      name = "WhatsApp";
    }
  ];
in
{
  home.file.".mozilla/firefox/nix/taskbartabs/taskbartabs.json".text = builtins.toJSON {
    version = 1;
    taskbarTabs = taskbartabs;
  };

  xdg.desktopEntries = builtins.listToAttrs (
    builtins.map (entry: {
      name = "firefox-taskbartabs-${entry.id}";
      value = {
        type = "Application";
        inherit (entry) name;
        exec = "firefox -taskbar-tab ${entry.id} -new-window ${entry.startUrl}";
      };
    }) taskbartabs
  );
}

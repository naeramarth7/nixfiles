{ ... }: {
  ##############
  ### Globals ##
  ##############
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.universalaccess.reduceTransparency = true;

  ############
  ### Dock ###
  ############
  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.tilesize = 24;

  # Properly display apps in mission control when using aerospace
  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  system.defaults.dock.expose-group-apps = true;

  ###############
  ### Menubar ###
  ###############
  # Hide menu bar in favor of sketchybar
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  ###############
  ### Desktop ###
  ###############
  system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;
}

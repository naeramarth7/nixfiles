{ ... }:
{
  ################
  ### Keyboard ###
  ################
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  #############
  ### Mouse ###
  #############
  # Drag windows via Ctrl+Cmd+Click
  system.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
}

{ config, pkgs, lib, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  #services.xserver.layout = "us";
   services.xserver.xkb.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;
   services.libinput.enable = true;

  #Tell Xorg to use Nvidia Drivers (Also works for Wayland)
    services.xserver.videoDriver = "nvidia";

  services.displayManager.lightdm.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "crawford";
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.steam.gamescopeSession.enable = true;
  programs.gamescope.enable = true;



}

{ config, pkgs, lib, ... }:
{
  #hardware.nvidia.prime.sync.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  #services.xserver.layout = "us";
  services.xserver.xkb.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;
   #services.libinput.enable = true;

  #Tell Xorg to use Nvidia Drivers (Also works for Wayland)
  services.xserver.videoDrivers = ["nvidia"];

  services.displayManager.defaultSession = "steam";

  #services.xserver.displayManager.lightdm.enable = true;

  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;
  services.getty.autologinUser = "crawford";

  programs.steam = { 
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        withPrimus = true;
      };
      extraLibraries = p: with pkgs; [bumblebee glxinfo mangohud];
    };
  };
  programs.gamescope = {
    enable = true;
    #capSysNice = true;
  };

  environment = {
  #systemPackages = with pkgs; [mangohud];
  loginShellInit = '' [[ "$(tty)" = "/dev/tty1" ]] '';
  };
}

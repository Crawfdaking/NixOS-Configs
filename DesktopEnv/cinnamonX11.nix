{ config, pkgs, lib, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  environment = {
#  	gnome = {
#		excludePackages = with pkgs.gnome; [];
#	};
	shells = with pkgs; [zsh];
  };

  # Configure keymap in X11
   services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;

  #Tell Xorg to use Nvidia Drivers (Also works for Wayland)
    services.xserver.videoDriver = "nvidia";
}

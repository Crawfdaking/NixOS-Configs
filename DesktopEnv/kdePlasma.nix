{ config, pkgs, lib, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment = {
  	plasma6 = {
		excludePackages = with pkgs.libsForQt5; [okular elisa gwenview];
	};
	shells = with pkgs; [zsh];
  };
  # Package specific to kde.
  users.users.crawford = {
	packages = with pkgs.libsForQt5; [
		yakuake
	];

};

  # Configure keymap in X11
  #services.xserver.layout = "us";
   services.xserver.xkb.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;
   services.libinput.enable = true;

  #Tell Xorg to use Nvidia Drivers (Also works for Wayland)
    services.xserver.videoDrivers = ["nvidia"];
}

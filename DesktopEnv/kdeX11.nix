{ config, pkgs, lib, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  environment = {
  	plasma5 = {
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
   services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;

  #Tell Xorg to use Nvidia Drivers (Also works for Wayland)
    services.xserver.videoDriver = "nvidia";
}

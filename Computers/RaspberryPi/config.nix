#Configuration specific to the raspberrypi 4

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #"${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/4"
    ];

  #add the Nix User Repository (NUR) to nix
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.loader.timeout = 1;

  hardware = {
    #raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    #deviceTree = {
      #enable = true;
      #filter = "*rpi-4-*.dtb";
    #raspberry-pi."4".fkms-3d.enable = true;
    enableRedistributableFirmware = true;
    #};
  };

   networking.hostName = "Crawfords_pi"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "America/Los_Angeles";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     packages = with pkgs; [terminus_font];
     font = "${pkgs.terminus_font}/share/consolefonts/ter-i16b.psf.gz";
     keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
   };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
   #services.printing.enable = true;

  # Enable sound.
   #sound.enable = true;
   #hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.defaultUserShell = pkgs.zsh;
   users.users.crawford = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager"]; # "audio" ]; # Enable ‘sudo’ for the user.
   };

   environment.systemPackages = with pkgs; [
	libraspberrypi
	raspberrypi-eeprom
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs = {
     gnupg.agent = {
         enable = true;
         enableSSHSupport = true;
   	};
    zsh.enable = true;
    };

  # List services that you want to enable:
  services.locate.enable = true;

  #Enables mdns support
  services.avahi = {
	enable = true;
	nssmdns = true;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
   system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

 ### automatic upgrade
  system.autoUpgrade = {
      enable = true;
      allowReboot = true;
      channel = "https://nixos.org/channels/nixos-23.05";
  };
  
  #Allows and tells nixs how to optimize storage
  nix = {
    settings = {
    auto-optimise-store = true;
    #Enable experimental nix features
    experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
	automatic = true;
  	dates = "weekly";
  	options = "--delete-older-than 7d";
    };
  };

}


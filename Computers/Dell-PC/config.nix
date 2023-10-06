# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  #add the Nix User Repository (NUR) to nix
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };


  # Use the systemd-boot EFI boot loader.
  boot = {
  	# Enable binfmt emulation of aarch64-linux.
#  	binfmt = { 
#		emulatedSystems = [ "aarch64-linux" ];
#	};
    loader = {
    	systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;

	#Adjust how long the bootloader waits for userinput before booting to default 
	timeout = 1;
     };
  };
  
  #Allow Unfree software
  nixpkgs.config.allowUnfree = true;


   networking.hostName = "Crawfords_Linux_PC"; # Define your hostname.
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
     #keyMap = "us";
     useXkbConfig = true; # use xkbOptions in tty.
   };


  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
  	enable = true;
	#Adds extra audio codec support
	package = pkgs.pulseaudioFull;
	# Auto switches audio to bluetooth when a device is connected
	extraConfig = "load-module module-switch-on-connect";
  };

  # Enable and configure bluetooth support
  hardware.bluetooth = {
	enable = true;
	settings = {
		General = {
		#Enables A2DP Sink (enabling recommended, most modern headphones use this
		Enable = "Source,Sink,Media,Socket";
		};
	};
  };

  # Provides a bluetooth GUI in case desktop enviorment does not have one already
  #services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.defaultUserShell = pkgs.zsh;
    users.users.crawford = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkmanager"]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
     environment.systemPackages = with pkgs; [
     	git
	vim
	nano
	curl
	wget
	findutils
	tldr
	htop
	pciutils
	lshw
	lm_sensors
	xclip
 ];

  # Enable auto-cpufreq daemon
  services.auto-cpufreq.enable = true;

  services.locate.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs = {
   mtr.enable = true;
   	gnupg.agent = {
     		enable = true;
     		enableSSHSupport = true;
   	};
   zsh.enable = true;
   #tmux.enable = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 631 139 443 445 515 9100 9102];
  # networking.firewall.allowedUDPPorts = [ 5353 137 445 161];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

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

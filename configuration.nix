# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
    	systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
	#Adjust how long the bootloader waits for userinput before booting to default 
	timeout = 1;
     };
  };
  
  #Allow Unfree software
  nixpkgs.config.allowUnfree = true;

  #Nvidia Drivers
  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Tell Xorg to use the nvidia driver (also valid for Wayland)
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;

    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = false;

    # Enable the nvidia settings menu
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    #package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  # Enables and configures integrated and dedicated gpus to work together
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

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
     font = "Lat2-Terminus16";
     keyMap = "us";
     #useXkbConfig = true; # use xkbOptions in tty.
   };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
   services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

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

  # Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkmanager"]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
       tor
       discord
       bitwarden
       bitwarden-cli
       authy
       flameshot
       ngrok
       vlc
       tmux
       libsForQt5.yakuake
       gh
       steam
       lutris
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
     environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     neovim      
     wget
     curl
     lolcat
     cowsay
     tldr
     gnutar
     unzip
     neofetch
     htop
     git
     pciutils
     lshw
     gparted
     auto-cpufreq
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

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
      channel = "https://nixos.org/channels/nixos-23.05";
  };
  
  #Allows and tells nixs how to optimize storage
  nix = {
    settings.auto-optimise-store = true;
    gc = {
	automatic = true;
  	dates = "weekly";
  	options = "--delete-older-than 7d";
    };
  };
}


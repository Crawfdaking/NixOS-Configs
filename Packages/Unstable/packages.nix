{ config, pkgs, lib, ... }:

{  
  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    packages = with pkgs.unstable; [
       #Graphical Packages
       /*
       discord
       joplin-desktop
       steam
       tor
       bitwarden-desktop
       ente-auth
       yubioath-flutter
       ungoogled-chromium
       flameshot
       vlc
       lutris
       keepassxc
       thunderbird
       lxappearance
       lxappearance-gtk2
       */
       # Terminal Packages
       /*
       ngrok
       nixos-generators
       localsend
       */
       bitwarden-cli
       rclone
       gh
    ];
  };

     environment.systemPackages = with pkgs.unstable; [
     	lolcat
     	cowsay
     	gnutar
     	unzip
     	neofetch
     	gparted
     	git
     	fend
     	lazygit
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
     	ncdu
     	dig
	acpi
 ];

}

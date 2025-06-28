{ config, pkgs, lib, ... }:

{

   
  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    packages = with pkgs.unstable; [
       rclone
       gh
       discord
       joplin-desktop
       #ngrok
       #steam
       #tor
       bitwarden-desktop
       bitwarden-cli
       ente-auth
       yubioath-flutter
       #vlc
       #lutris
       flameshot
       #keepassxc
       #nixos-generators
       #libsForQt5.ark
       localsend
       ungoogled-chromium
       #thunderbird
       #lxappearance
       #lxappearance-gtk2
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
     	#vim
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
 ];

}

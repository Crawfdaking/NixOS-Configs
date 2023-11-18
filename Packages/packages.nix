# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./Tailscale/tailscale.nix
    ./AdguardHome/adguardHome.nix
    ./Unbound/unbound.nix
    #./Vaultwarden/vaultwarden.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    packages = with pkgs; [
       gh
      # discord
      # authy
      # joplin-desktop
      # ngrok
      # steam
      # tor
      # bitwarden
      # bitwarden-cli
      # vlc
      # lutris
      # flameshot
      # keepassxc
      # nixos-generators
      # libsForQt5.ark
      # localsend
      # ungoogled-chromium
      # thunderbird
    ];
  };

# Needed in order for localsend to work
#networking.firewall.interfaces.wlp3s0.allowedTCPPorts = [53317];
#networking.firewall.interfaces.wlp3s0.allowedUDPPorts = [53317];

environment.systemPackages = with pkgs; [
     lolcat
     cowsay
     gnutar
     unzip
     neofetch
     gparted
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
     dig
 ];
}

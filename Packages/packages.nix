# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    packages = with pkgs; [
       discord
       authy
       ngrok
       steam
       tor
       bitwarden
       bitwarden-cli
       vlc
       libsForQt5.yakuake
       lutris
       flameshot
       keepassxc
       #nixos-generators
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
     environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     lolcat
     cowsay
     tldr
     gnutar
     unzip
     neofetch
     htop
     pciutils
     lshw
     gparted
     lm_sensors
     xclip
 ];
}

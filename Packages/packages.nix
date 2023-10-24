# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./Tailscale/tailscale.nix
  ];

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
       lutris
       flameshot
       keepassxc
       #nixos-generators
    ];
  };

     environment.systemPackages = with pkgs; [
     lolcat
     cowsay
     gnutar
     unzip
     neofetch
     gparted
 ];
}

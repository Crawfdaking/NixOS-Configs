# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./Tailscale/tailscale.nix
    ./AdguardHome/adguardHome.nix
    ./Unbound/unbound.nix
    ./Vaultwarden/vaultwarden.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    packages = with pkgs; [
        gh
       #discord
       #authy
       #ngrok
       #steam
       #tor
       #bitwarden
       #bitwarden-cli
       #vlc
       #lutris
       #flameshot
       #keepassxc
       #nixos-generators
       #libsForQt5.ark
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

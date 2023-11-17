{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> {};
in {

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.crawford = {
    packages = with unstable; [
    ];
  };

     environment.systemPackages = with unstable; [
 ];

}

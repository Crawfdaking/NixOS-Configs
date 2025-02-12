# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
	hardware.graphics.extraPackages = with pkgs; [
		 #New intel graphics
 		 intel-media-driver

		 #Older intel graphics
		 #vaapiIntel

		 # Gen 8 intel graphics
		 intel-compute-runtime
	];
}

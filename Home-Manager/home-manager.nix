{ config, pkgs, lib, ... }:

{
    imports = [
    	<home-manager/nixos>
#	./Packages/zsh.nix
#	./Packages/firefox.nix
#	./Packages/bat.nix
#	./Packages/git.nix
#	./Packages/neovim.nix
#	./Packages/gh.nix
#	./Packages/tmux.nix
    ];
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
    services = {
       home-manager = {
		autoUpgrade = {
			enable = true;
			frequency = "weekly";
			};
		};
     };
     home = { 
     stateVersion = "23.05";
     };
   };
}

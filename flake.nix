{

	description = "NixOS flake";
	
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		NixUserRepos.url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
	};
	
	outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, NixUserRepos, ...}/*@inputs*/:
	let
      	system = "x86_64-linux";
      	overlay-unstable = final: prev: {
        #unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
         unstable = import nixpkgs-unstable {
           inherit system;
           config.allowUnfree = true;
         };
	  nur = import (builtins.fetchTarball NixUserRepos/*.url*/) {
		inherit system;
	};

};
    	in {
	##Used with 'nixos-rebuild switch --flake .#<hostname>'
	##nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation
	nixosConfigurations.Dell-PC = nixpkgs.lib.nixosSystem { 
		inherit system;
		#specialArgs = {inherit inputs;};
		modules = [
			({config, pkgs, ...}: {nixpkgs.overlays = [overlay-unstable];})
			 ./Computers/baseConfig.nix
      			 ./Drivers/nvidia.nix
      			 ./Drivers/intel.nix
      			 ./Packages/packages.nix
      			 #./DesktopEnv/kdeWayland.nix
      			  ./DesktopEnv/kdeX11.nix
      			 #./DesktopEnv/gnomeX11.nix
      			 #./DesktopEnv/xfceX11.nix
      			 #./DesktopEnv/cinnamonX11.nix
      			 #./DesktopEnv/lxqtX11.nix
			home-manager.nixosModules.home-manager {

			home-manager.useGlobalPkgs=true;
			home-manager.useUserPackages=true;
			home-manager.users.crawford = import ./Home-Manager/home-manager.nix;

			}
		   ];
		}; 
	    };

}

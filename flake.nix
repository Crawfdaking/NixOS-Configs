{
	description = "NixOS flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		#gitEmail.url = path:/home/crawford/Desktop/NixOS-Configs/Env;
	};
	
	outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ...}@inputs:
	let
      	system = "x86_64-linux";
      	overlay-unstable = final: prev: {
        #unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
         unstable = import nixpkgs-unstable {
           inherit system;
           config.allowUnfree = true;
         };

      	};
    	in {
	##Used with 'nixos-rebuild switch --flake .#<hostname>'
	##nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation
	nixosConfigurations.Dell-PC = nixpkgs.lib.nixosSystem { 
		inherit system;
		modules = [
			({config, pkgs, ...}: {nixpkgs.overlays = [overlay-unstable]; })
			./configuration.nix
			home-manager.nixosModules.home-manager {

			home-manager.useGlobalPkgs=true;
			home-manager.useUserPackages=true;
			home-manager.users.crawford = import ./Home-Manager/home-manager.nix;

			}
		   ];
		}; 
	    };

}

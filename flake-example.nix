#{

	#description = "Flake description";
	
	/*inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
	}; */
	
	#outputs = {self, ...}/*@inputs*/: {
		
	##Executed by 'nix flake check'
	#checks."<system>"."<name>" = derivation;
	
	##Executed by 'nix build .#<name>'
	#packages."<system>"."<name>" = derivation;
	
	##Executed by 'nix build .'
	#packages."<system>".default = derivation;
	
	##Executed by 'nix run .#<name>'
	/*apps."<system>."<name>" = {
		type = "app";
		program = "<store-path>";
	
	}; */
	
	
	##Executed by 'nix run . -- <args?>'
	#apps."<system>".default = { type = "app"; program = "..."; };
	
	##Formatter (alejandra, nixfmt or nixpkgs-fmt)
	#formatter."<system>" = derivation;
	
	##Used for nixpkgs packages, also accessible via 'nix build .#<name>'
	#legacyPackages."<system>"."<name>" = derivation;
	
	##Overlay, consumed by other flakes
	#overlays."<name>" = final: prev: {};
	
	##NixOS modules, consumed by other flakes
	#nixosModules."<name>" = {config, ...}: {options = {}; config ={}; };
	
	##NixOS default module
	#nixosModules.default = {config, ...}: {options = {}; config ={}; };
	
	##Used with 'nixos-rebuild switch --flake .#<hostname>'
	##nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation
	#nixosConfigurations."<hostname>" = {};
	
	##Used by 'nix develop .#<name>'
	#devshells."<system>"."<name>" = derivation;
	
	##Used by 'nix develop .default'
	#devshells."<system>".default = derivation;
	
	##Hydra build jobs
	#hydraJobs."<attr>"."<system>" = derivation;
	
	##Used by 'nix flake init -t <flake>#<name>'
	/*templates."<name>" = {
		path = "<store-path>";
		description = "template description here";
	}; */
	
	##Used by 'nix flake init -t <flake>'
	#templates.default = { path = "<store-path>"; description = "template description here"; };

	#};

#}

{ config, pkgs, lib, ... }:
let
	neovimConfig = (pkgs.fetchFromGitHub {
		owner = "Crawfdaking";
		repo = "Neovim-Config";
		rev = "acb461c4c3586b096994e53736e4d5c2266d0a92";
		hash = "sha256-rXYl0Kv9Z/wkrQRs0iK6jnak0B+aOPj3dEgw1Y7qLTI=";

	});
in {
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	neovim = {
	  enable = true;
	  defaultEditor = true;
	  plugins = with pkgs.vimPlugins; [
	  	lazy-nvim
		nvim-treesitter.withAllGrammars
	  ];
	  extraPackages = with pkgs; [gcc];
	};
     };
    xdg.configFile.nvim = {
    source = neovimConfig;
    recursive = true;
    };
  };

}

{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	neovim = {
	  enable = true;
	  defaultEditor = true;
	  extraLuaConfig = lib.fileContents /home/crawford/Neovim-Config/init.lua;
	  plugins = with pkgs.vimPlugins; [
	  	lazy-nvim
		nvim-treesitter.withAllGrammars
	  ];
	  extraPackages = with pkgs; [gcc];
	};
     };
    ## This method does not work to grab neovim config files. Creates a symlink in ~/.config named nvim with no lua extention
    #xdg.configFile.nvim = {
    #source = /home/crawford/Neovim-Config/init.lua;
    #recursive = true;
    #};
  };

}

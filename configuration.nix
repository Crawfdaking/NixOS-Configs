{ config, pkgs, lib, ... }:

{
  imports =
    [
       ./Computers/Dell-PC/config.nix
       ./Home-Manager/home-manager.nix
       ./Drivers/nvidia.nix
       #./Packages/packages.nix
       ./DesktopEnv/kde.nix
    ];
}

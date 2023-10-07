{ config, pkgs, lib, ... }:

{
  imports =
    [
       ./Computers/Dell-PC/config.nix
       ./Home-Manager/home-manager.nix
       ./Drivers/nvidia.nix
       ./Packages/packages.nix
       ./DesktopEnv/kdeWayland.nix
       #./DesktopEnv/gnomeX11.nix
       #./DesktopEnv/xfceX11.nix
    ];
}

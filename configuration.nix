{ config, pkgs, lib, ... }:

{
  imports =
    [
       ./Computers/baseConfig.nix
       ./Home-Manager/home-manager.nix
       ./Drivers/nvidia.nix
       ./Packages/packages.nix
       #./DesktopEnv/kdeWayland.nix
        ./DesktopEnv/kdeX11.nix
       #./DesktopEnv/gnomeX11.nix
       #./DesktopEnv/xfceX11.nix
       #./DesktopEnv/cinnamonX11.nix
       #./DesktopEnv/lxqtX11.nix
    ];
}

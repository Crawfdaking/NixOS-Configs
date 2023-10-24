{ config, pkgs, ... }:

{
  #imports = [
   # ./autoAuth.nix
  #];

  # make the tailscale command usable to users
  users.users.crawford.packages = with pkgs; [ pkgs.tailscale ];

  # enable the tailscale service
  #services.tailscale.enable = true;
}

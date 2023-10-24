{ config, pkgs, ... }:

{
  #imports = [
   # ./autoAuth.nix
  #];

  # make the tailscale command usable to users
  users.users.crawford.packages = with pkgs; [ pkgs.tailscale ];

  # enable the tailscale service
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

    networking.firewall = {
    # enable the firewall (By default true)
    enable = true;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    #allowedTCPPorts = [ 22 ];
  };


}

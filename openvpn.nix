{ config, pkgs, ... }:

{
  services.openvpn.servers = {
    nordvpn = { config = '' config /etc/nixos/config/nordvpn.conf ''; };
  };
}

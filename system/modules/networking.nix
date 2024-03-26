{ config, pkgs, ... }:

{
  networking = {
	hostName = "nixos-personal";
	networkmanager.enable = true;
	enableIPv6 = false;
	firewall.enable = false;
  };
}

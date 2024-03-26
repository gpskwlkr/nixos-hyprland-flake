{ config, pkgs, lib, ... }:

{
 # Switched to lanzaboote Secure Boot
 #  boot = {
	# kernelParams = ["nohibernate" "ipv6.disable=1"];
	# tmp.cleanOnBoot = true;
	# supportedFilesystems = ["ntfs"];
	# loader = {
	# 	grub = {
	# 		device = "nodev";
	# 		efiSupport = true;
	# 		enable = true;
	# 		useOSProber = true;
	# 		timeoutStyle = "menu";
 #            efiInstallAsRemovable = true;
 #            extraConfig = ''
 #                insmod tpm
 #            '';
	# 	};
	# 	timeout = 300;
	# };
 #  };

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}

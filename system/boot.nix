{ config, pkgs, ... }:

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

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}

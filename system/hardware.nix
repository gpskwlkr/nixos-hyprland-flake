{ config, pkgs, ... }: 

{
 hardware = {
    bluetooth.enable = true;

	opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};
 };
}

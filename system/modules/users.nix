{ config, pkgs, ... }:

{
users.users.gpskwlkr = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ 
     	"wheel" 
        "qemu"
        "kvm"
        "libvirtd"
        "networkmanager"
        "docker"
     ]; 
   };
}

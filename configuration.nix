{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/modules 
  ];

  system.stateVersion = "23.11"; 
}


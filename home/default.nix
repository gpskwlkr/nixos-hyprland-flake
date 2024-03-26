{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./user
  ];
  
  home.username = "gpskwlkr";
  home.homeDirectory = "/home/gpskwlkr";
  home.stateVersion = "23.11";
}


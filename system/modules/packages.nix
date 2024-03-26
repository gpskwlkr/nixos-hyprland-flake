
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    fzf
    gimp
    git
    lm_sensors
    neofetch
    neovim
    ripgrep
    sysstat
    tldr
    unzip
    wget
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    zoxide
  ];
}


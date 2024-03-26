
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    fzf
    git
    lm_sensors
    neofetch
    neovim
    ripgrep
    tldr
    unzip
    wget
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    zoxide
  ];
}


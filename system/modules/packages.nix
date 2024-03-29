
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    eza
    fzf
    git
    gnumake
    lm_sensors
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qt5-svg
    neofetch
    neovim
    ripgrep
    tldr
    unzip
    wget
    xfce.thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    zoxide
  ];
}


{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.adwaita-icon-theme # default gnome cursors
    glib 
    gsettings-desktop-schemas

    nwg-look
  ];
}

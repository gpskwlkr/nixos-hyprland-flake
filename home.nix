{ config, pkgs, pkgs-unstable, lib, inputs, ... }:
let configDir = ./user/config;
in
{
  imports = [
    ./user/sh.nix
    ./user/git
  ];
  
  home.username = "gpskwlkr";
  home.homeDirectory = "/home/gpskwlkr";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.nnn 
    pkgs.qbittorrent
    pkgs.telegram-desktop
    pkgs.fnm
    pkgs.blueberry

    pkgs-unstable.vesktop
    pkgs-unstable.hyprshot
    pkgs-unstable.discord-screenaudio
  ];


  # FIX: make it automatically scan config dir and symlink all folders
  home.file = {
      ".config/nvim".source = "${configDir}/nvim";
      ".config/wallpapers".source = "${configDir}/wallpapers";
      ".config/kitty".source = "${configDir}/kitty";
      ".config/neofetch".source = "${configDir}/neofetch";
      ".config/hypr".source = "${configDir}/hypr";
      ".config/swayidle".source = "${configDir}/swayidle";
      ".config/swaylock".source = "${configDir}/swaylock";
      ".config/wlogout".source = "${configDir}/wlogout";
      ".config/waybar".source = "${configDir}/waybar";
      ".config/btop".source = "${configDir}/btop";
      ".config/wofi".source = "${configDir}/wofi";
      ".config/mako".source = "${configDir}/mako";
  };

  gtk = {
    enable = true;

    cursorTheme = {
        name = "Catppuccin-Macchiato-Teal";
        package = pkgs.catppuccin-gtk;
    };

    gtk3.extraConfig = {
        Settings = ''
            gtk-application-prefer-dark-theme = 1;
            gtk-cursor-theme-name=Catppuccin-Macchiato-Teal
        '';
    };

    gtk4.extraConfig = {
        Settings = ''
            gtk-application-prefer-dark-theme = 1;
            gtk-cursor-theme-name=Catppuccin-Macchiato-Teal
        '';
    };
  };

   home.sessionVariables = {
	     BROWSER = "firefox";
	     EDITOR = "nvim";
	     TERMINAL = "kitty";
	     NIXOS_OZONE_WL = "1";
	     QT_QPA_PLATFORMTHEME = "gtk3";
	     QT_SCALE_FACTOR = "1";
	     MOZ_ENABLE_WAYLAND = "1";
	     SDL_VIDEODRIVER = "wayland";
	     QT_QPA_PLATFORM = "wayland-egl";
	     QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
	     QT_AUTO_SCREEN_SCALE_FACTOR = "1";
	     WLR_DRM_DEVICES = "/dev/dri/card0";
	     WLR_NO_HARDWARE_CURSORS = "1"; 
	     CLUTTER_BACKEND = "wayland";
	     WLR_RENDERER = "vulkan";
         XCURSOR_SIZE = "24";
	     XDG_CURRENT_DESKTOP = "Hyprland";
	     XDG_SESSION_DESKTOP = "Hyprland";
	     XDG_SESSION_TYPE = "wayland";
	     GTK_USE_PORTAL = "1";
	     NIXOS_XDG_OPEN_USE_PORTAL = "1";
	     XDG_CACHE_HOME = "\${HOME}/.cache";
	     XDG_CONFIG_HOME = "\${HOME}/.config";
	     #XDG_BIN_HOME = "\${HOME}/.local/bin";
	     XDG_DATA_HOME = "\${HOME}/.local/share";

  };

  programs.firefox = {
    enable = true;

    profiles.gpskwlkr = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
            bypass-paywalls-clean
            darkreader
            facebook-container
            i-dont-care-about-cookies
            proton-pass
            to-google-translate
            view-image
            youtube-shorts-block
        ];
    };
  };

  programs.home-manager.enable = true;
}


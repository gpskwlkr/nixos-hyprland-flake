let configDir = ../config;
in
{
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
}

{ pkgs, ... }:
{
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
}

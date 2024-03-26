{ inputs, ... }:
{
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
            ublock-origin
            youtube-shorts-block
        ];
    };
  };

  programs.home-manager.enable = true;
}

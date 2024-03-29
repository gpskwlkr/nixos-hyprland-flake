{ config, pkgs, ... }:
let 
  myAliases = {
    docker-compose = "podman-compose";
    cat = "bat";
    ls = "eza --icons=always";

    fullClean = '' 
        nix-collect-garbage --delete-old

        sudo nix-collect-garbage -d

        sudo /run/current-system/bin/switch-to-configuration boot
    '';
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
    fullRebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/ && home-manager switch --flake ~/.dotfiles/ -b backup";
    homeRebuild = "home-manager switch --flake ~/.dotfiles/ -b backup";
};
in
{
  programs = {
	zsh = {
		enable = true;
		enableAutosuggestions = true;
		syntaxHighlighting.enable = true;
		initExtra = '' 
            source ~/.p10k.zsh && 
            eval "$(zoxide init --cmd cd zsh)" && 

            export PATH="$PATH:/home/gpskwlkr/.dotnet/tools"
        ''; 
		shellAliases = myAliases;
		oh-my-zsh = {
			enable = true;
			custom = "$HOME/.oh-my-custom";
			theme = "powerlevel10k/powerlevel10k";
			plugins = [
				"git"
				"history"
				"wd"
			];
		};
	};
  };
}

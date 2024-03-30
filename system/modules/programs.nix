{ config, pkgs, ... }: 

{

 xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
 };

 programs = {
	steam = { 
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};

    hyprland = {
        enable = true;

        xwayland = {
            enable = true;
        };

        portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    gnupg = {
		agent = {
			enable = true;
			enableSSHSupport = true;
		};
	};

    tmux = {
        enable = true;
        escapeTime = 0;
        
        plugins = with pkgs; [
            tmuxPlugins.vim-tmux-navigator
            tmuxPlugins.resurrect
            tmuxPlugins.continuum
            tmuxPlugins.catppuccin
        ];

        extraConfig = ''
            set -g default-terminal "xterm-256color"
            set -ga terminal-overrides ",*256col*:Tc"
            set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
            set-environment -g COLORTERM "truecolor"
            set -g prefix C-a
            unbind C-b
            bind-key C-a send-prefix

            unbind %
            bind | split-window -h

            unbind '"'
            bind - split-window -v

            unbind r
            bind r source-file ~/.tmux.conf

            bind -r j resize-pane -D 5
            bind -r k resize-pane -U 5
            bind -r l resize-pane -R 5
            bind -r h resize-pane -L 5

            bind -r m resize-pane -Z

            set -g mouse on

            set-window-option -g mode-keys vi

            bind-key -T copy-mode-vi 'v' send -X begin-selection
            bind-key -T copy-mode-vi 'y' send -X copy-selection

            unbind -T copy-mode-vi MouseDragEnd1Pane

            set -g @resurrect-capture-pane-contents 'on'
            set -g @continuum-restore 'on'
            set -g @catppuccin-flavour 'macchiato'
        '';
    };

    zsh.enable = true;
	mtr.enable = true;
 };

}

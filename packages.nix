{ pkgs, ... }: {
    environment.systemPackages = with pkgs;  [ 

	# sway and associated utilities
	swaybg
	xwayland
	brightnessctl
	gammastep
	wl-clipboard 
	wtype
	sway-launcher-desktop
	waybar

	# browser
	firefox

	# terminal 
	fzf 
	ripgrep
	eza
	fd
	tree
	killall
	unzip
	zip
	ncdu

	# utilities
	git
	htop 
	bottom
	trash-cli 
	parted
	mdadm
	smartmontools

	# ssh and network
	openssh 
	sshpass
	tailscale

	# syncing utilities
	rsync
	borgbackup

	# containers
	docker-compose

	];
}

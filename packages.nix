{ pkgs, ... }: {
    environment.systemPackages = with pkgs;  [ 

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

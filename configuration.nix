{ config, pkgs, ... }:
{
    imports =
	[ 
	./hardware-configuration.nix

	# configs
	./packages.nix
	./nvim.nix

	# timers
	./timers/raid_health.nix
	./timers/update.nix

	];

    # bootloader
    boot.loader.grub = {
	enable = true;
	useOSProber = true;
	device = "/dev/nvme0n1";
    };

    boot.swraid = {
	enable = true;
	mdadmConf = ''
	    ARRAY /dev/md0 metadata=1.2 UUID=e10e4431:f7ba7b1e:59be28db:6f212bf7
	    MAILADDR blairfix@fastmail.com
	    '';
    };

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # hostname
    networking.hostName = "nas"; 

    # networking
    networking.networkmanager.enable = true;

    # time zone
    time.timeZone = "America/Edmonton";

    # utf8 setting
    i18n.defaultLocale = "en_CA.UTF-8";

    # tailscale
    services.tailscale.enable = true;

    # disable sleep
    systemd.sleep.extraConfig = ''
	AllowSuspend=no
	AllowHibernation=no
	AllowHybridSleep=no
	AllowSuspendThenHibernate=no
	'';

    # enable sway window manager
    programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
    };


    # ssh
    services.openssh = {
	enable = true;
	ports = [ 22 ];
	settings = {
	    PasswordAuthentication = false;
	    PermitRootLogin = "no"; 
	};
    };

    # docker
    virtualisation.docker.enable = true;

    # user account. Add password with ‘passwd’.
    users.users.blair = {
	isNormalUser = true;
	description = "blair";
	extraGroups = [ 
	    "networkmanager" 
	    "wheel" 
	    "docker"
	];
    };

    # unfree packages
    nixpkgs.config.allowUnfree = true;


    # for bash scripts 
    services.envfs.enable = true;

    # version 
    system.stateVersion = "24.05"; 

}

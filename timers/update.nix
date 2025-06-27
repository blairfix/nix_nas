{ config, pkgs, ... }:
{

    # start update
    #----------------------------------------

    systemd.timers."update" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-02 12:00:00";
	    Persistent = "true";
	    Unit = "update.service";
	};
    };

    systemd.services."update" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	};

	path = with pkgs; [ 
	    bash
	    nixos-rebuild
	    nix
	];
	script = ''
	    bash /home/blair/bin/update.sh
	    '';
    };
}

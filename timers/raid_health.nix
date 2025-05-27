{ config, pkgs, ... }:
{

    # start raid_health
    #----------------------------------------

    systemd.timers."raid_health" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    #OnCalendar = "daily";
	    OnCalendar= "*-*-* 09:20:00";
	    Persistent = "true";
	    Unit = "raid_health.service";
	};
    };

    systemd.services."raid_health" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	};

	path = with pkgs; [ 
	    bash
	    openssh
	    mdadm
	];
	script = ''
	    bash /home/blair/bin/raid_health.sh
	    '';
    };
}

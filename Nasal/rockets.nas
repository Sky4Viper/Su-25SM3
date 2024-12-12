
props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");

#initialize triggers
props.globals.initNode("/controls/armament/trigger1", 0, "BOOL");
setprop("/controls/armament/trigger1", 0);

props.globals.initNode("/controls/armament/trigger-S8-1-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-2-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-3-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-4-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-5-R", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-6-R", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-7-R", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-S8-8-R", 0, "BOOL");

#props.globals.initNode("/sim/multiplay/generic/int[9]", 0, "INT");

#ammo counter
props.globals.initNode("/controls/armament/rocketsLeft", 0.0, "INT");
props.globals.initNode("/controls/armament/rocketsCount", 0.0, "DOUBLE");
props.globals.initNode("/controls/armament/rocketsLeftS13", 0.0, "INT");
props.globals.initNode("/controls/armament/rocketsCountS13", 0.0, "DOUBLE");

#var reload = func {
#	if( getprop("/gear/gear[0]/wow") and getprop("/gear/gear[1]/wow") and getprop("/gear/gear[2]/wow") and (getprop("/velocities/groundspeed-kt") < 2) ) {
#		setprop("/controls/armament/rocketsLeft", 32);
#		setprop("/controls/armament/rocketsCount", 32);
#		screen.log.write("UB-32 rocket pods reloaded (32 rockets per pod)", 1, 0.6, 0.1);
#	}
#	else {
#		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
#	}
#}

var reload = func {
		var UB32mounted1L = (getprop("/sim/weight[1]/payload-int") == 3);
		var UB32mounted2L = (getprop("/sim/weight[2]/payload-int") == 3);
		var UB32mounted3L = (getprop("/sim/weight[3]/payload-int") == 3);
		var UB32mounted4L = (getprop("/sim/weight[4]/payload-int") == 3);
		var UB32mounted5R = (getprop("/sim/weight[5]/payload-int") == 3);
		var UB32mounted6R = (getprop("/sim/weight[6]/payload-int") == 3);
		var UB32mounted7R = (getprop("/sim/weight[7]/payload-int") == 3);
		var UB32mounted8R = (getprop("/sim/weight[8]/payload-int") == 3);

		var BL13mounted3L = (getprop("/sim/weight[2]/payload-int") == 9);
		var BL13mounted4L = (getprop("/sim/weight[3]/payload-int") == 9);
		var BL13mounted7R = (getprop("/sim/weight[6]/payload-int") == 9);
		var BL13mounted8R = (getprop("/sim/weight[7]/payload-int") == 9);

		if(BL13mounted3L or BL13mounted4L or BL13mounted7R or BL13mounted8R) {
		setprop("/controls/armament/rocketsLeftS13", 5);
		setprop("/controls/armament/rocketsCountS13", 5);
		screen.log.write("BL-13 rocket pods reloaded (5 rockets per pod)", 1, 0.6, 0.1);
		}
		if(UB32mounted1L or UB32mounted2L or UB32mounted3L or UB32mounted4L or UB32mounted5R or UB32mounted6R or UB32mounted7R or UB32mounted8R) {
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		screen.log.write("B-8M1 rocket pods reloaded (20 rockets per pod)", 1, 0.6, 0.1);
		}
		else {
		screen.log.write("No rocket pod loaded. Load rocket pods first!", 1, 0.6, 0.1);
		}
}

#A resource friendly way of ammo counting: Instead of counting every bullet, I set an interpolate on float variant of ammo counter. But I need a timer to cut off fire when out of ammo. 

var outOfAmmo = maketimer(1.0, 
	func { 
		#print("Out of rockets! ");
		screen.log.write("Out of S-8 rockets! ", 1, 0.6, 0.1);
		setprop("/controls/armament/trigger-S8-1-L", 0);
		setprop("/controls/armament/trigger-S8-2-L", 0);
		setprop("/controls/armament/trigger-S8-3-L", 0);
		setprop("/controls/armament/trigger-S8-4-L", 0);
		setprop("/controls/armament/trigger-S8-5-R", 0);
		setprop("/controls/armament/trigger-S8-6-R", 0);
		setprop("/controls/armament/trigger-S8-7-R", 0);
		setprop("/controls/armament/trigger-S8-8-R", 0);
		setprop("/sim/multiplay/generic/int[9]", 0);
		setprop("/controls/armament/rocketsCount", 0);
		setprop("/controls/armament/rocketsLeft", 0);
		setprop("/controls/armament/trigger1", 0);
	}
);
outOfAmmo.singleShot = 1;

var outOfAmmoS13 = maketimer(1.0, 
	func { 
		#print("Out of S-13 rockets! ");
		screen.log.write("Out of S-13 rockets! ", 1, 0.6, 0.1);
		setprop("/controls/armament/trigger-S8-2-L", 0);
		setprop("/controls/armament/trigger-S8-3-L", 0);
		setprop("/controls/armament/trigger-S8-6-R", 0);
		setprop("/controls/armament/trigger-S8-7-R", 0);
		setprop("/sim/multiplay/generic/int[9]", 0);
		setprop("/controls/armament/rocketsCountS13", 0);
		setprop("/controls/armament/rocketsLeftS13", 0);
		setprop("/controls/armament/trigger1", 0);
	}
);
outOfAmmoS13.singleShot = 1;

var Rockets_Stop = maketimer(0.1, 
	func { 
		#print("Rockets Stopped! ");
		setprop("/controls/armament/trigger1", 0);
		setprop("/controls/armament/trigger-S8-1-L", 0);
		setprop("/controls/armament/trigger-S8-2-L", 0);
		setprop("/controls/armament/trigger-S8-3-L", 0);
		setprop("/controls/armament/trigger-S8-4-L", 0);
		setprop("/controls/armament/trigger-S8-5-R", 0);
		setprop("/controls/armament/trigger-S8-6-R", 0);
		setprop("/controls/armament/trigger-S8-7-R", 0);
		setprop("/controls/armament/trigger-S8-8-R", 0);
		setprop("/sim/multiplay/generic/int[9]", 0);
        if(getprop("/controls/armament/report-ammo")) {
			screen.log.write("S-8 rockets left: " ~ getprop("/controls/armament/rocketsLeft"), 1, 0.6, 0.1);
        }
	}
);
Rockets_Stop.singleShot = 1;

var Rockets_Ripple_2 = maketimer(0.05, 
	func { 
		#print("2x more rockets! ");
		setprop("/controls/armament/trigger-S8-1-L", 1);
		setprop("/controls/armament/trigger-S8-2-L", 1);
		setprop("/controls/armament/trigger-S8-3-L", 1);
		setprop("/controls/armament/trigger-S8-4-L", 1);
		setprop("/controls/armament/trigger-S8-5-R", 1);
		setprop("/controls/armament/trigger-S8-6-R", 1);
		setprop("/controls/armament/trigger-S8-7-R", 1);
		setprop("/controls/armament/trigger-S8-8-R", 1);
        Rockets_Stop.start(0.05);
        Rockets_Ripple_2.stop();
	}
);
Rockets_Ripple_2.singleShot = 1;

var Rockets_Ripple_4 = maketimer(0.1, 
	func { 
		#print("4x more rockets! ");
		setprop("/controls/armament/trigger-S8-1-L", 1);
		setprop("/controls/armament/trigger-S8-2-L", 1);
		setprop("/controls/armament/trigger-S8-3-L", 1);
		setprop("/controls/armament/trigger-S8-4-L", 1);
		setprop("/controls/armament/trigger-S8-5-R", 1);
		setprop("/controls/armament/trigger-S8-6-R", 1);
		setprop("/controls/armament/trigger-S8-7-R", 1);
		setprop("/controls/armament/trigger-S8-8-R", 1);
        Rockets_Stop.start(0.1);
        Rockets_Ripple_4.stop();
	}
);
Rockets_Ripple_4.singleShot = 1;

#trigger control with ammo counting
# 1L(1) 2L(2) 3L(3) 4L(4)
var triggerControl = func {
	triggerState = getprop("controls/armament/trigger1");
	RippleType = getprop("controls/armament/releaseq");
	if(triggerState and getprop("/controls/armament/rocketsLeftS13") > 0) {
		print("BL-13, loaded");
		var BL13mounted3L = (getprop("/sim/weight[2]/payload-int") == 9);
		var BL13mounted4L = (getprop("/sim/weight[3]/payload-int") == 9);
		var BL13mounted7R = (getprop("/sim/weight[6]/payload-int") == 9);
		var BL13mounted8R = (getprop("/sim/weight[7]/payload-int") == 9);

		if((BL13mounted3L or BL13mounted4L or BL13mounted7R or BL13mounted8R) and RippleType ==4) {
			print("BL-13, Fire salvo!");
			var fireTimeS13 = 0.25;

			if(BL13mounted3L) {
				setprop("/controls/armament/trigger-S8-2-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(BL13mounted4L) {
				setprop("/controls/armament/trigger-S8-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(BL13mounted7R) {
				setprop("/controls/armament/trigger-S8-6-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(BL13mounted8R) {
				setprop("/controls/armament/trigger-S8-7-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeftS13 = getprop("/controls/armament/rocketsLeftS13");
			setprop("/controls/armament/rocketsCountS13", rocketsLeftS13);
			interpolate("/controls/armament/rocketsCountS13", 0, 
				fireTimeS13*(rocketsLeftS13/5));
			outOfAmmoS13.restart(fireTimeS13*(rocketsLeftS13/5));
		}

		if((BL13mounted3L or BL13mounted4L or BL13mounted7R or BL13mounted8R) and RippleType ==1) {
			print("BL-13, Fire single!");
			if(BL13mounted3L) {
				setprop("/controls/armament/trigger-S8-2-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(BL13mounted4L) {
				setprop("/controls/armament/trigger-S8-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(BL13mounted7R) {
				setprop("/controls/armament/trigger-S8-6-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(BL13mounted8R) {
				setprop("/controls/armament/trigger-S8-7-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeftS13 = (getprop("/controls/armament/rocketsLeftS13") -1);
			setprop("/controls/armament/rocketsCountS13", rocketsLeftS13);
			Rockets_Stop.start(0.1);
		}
	}

	elsif(triggerState and getprop("/controls/armament/rocketsLeft") > 0) {
		var UB32mounted1L = (getprop("/sim/weight[1]/payload-int") == 3);
		var UB32mounted2L = (getprop("/sim/weight[2]/payload-int") == 3);
		var UB32mounted3L = (getprop("/sim/weight[3]/payload-int") == 3);
		var UB32mounted4L = (getprop("/sim/weight[4]/payload-int") == 3);
		var UB32mounted5R = (getprop("/sim/weight[5]/payload-int") == 3);
		var UB32mounted6R = (getprop("/sim/weight[6]/payload-int") == 3);
		var UB32mounted7R = (getprop("/sim/weight[7]/payload-int") == 3);
		var UB32mounted8R = (getprop("/sim/weight[8]/payload-int") == 3);
		
		if((UB32mounted1L or UB32mounted2L or UB32mounted3L or UB32mounted4L or UB32mounted5R or UB32mounted6R or UB32mounted7R or UB32mounted8R) and RippleType ==4) {
			var fireTime = 0.75; #continuous fire for 0.15s intervals
			if(UB32mounted1L) {
				setprop("/controls/armament/trigger-S8-1-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted2L) {
				setprop("/controls/armament/trigger-S8-2-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted3L) {
				setprop("/controls/armament/trigger-S8-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted4L) {
				setprop("/controls/armament/trigger-S8-4-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted5R) {
				setprop("/controls/armament/trigger-S8-5-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted6R) {
				setprop("/controls/armament/trigger-S8-6-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted7R) {
				setprop("/controls/armament/trigger-S8-7-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted8R) {
				setprop("/controls/armament/trigger-S8-8-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeft = getprop("/controls/armament/rocketsLeft");
			setprop("/controls/armament/rocketsCount", rocketsLeft);
			interpolate("/controls/armament/rocketsCount", 0, 
				fireTime*(rocketsLeft/20));
			outOfAmmo.restart(fireTime*(rocketsLeft/20));
		}

		if((UB32mounted1L or UB32mounted2L or UB32mounted3L or UB32mounted4L or UB32mounted5R or UB32mounted6R or UB32mounted7R or UB32mounted8R) and RippleType ==1) {
			var fireTime = 0.75; #continuous fire for 0.15s intervals
			if(UB32mounted1L) {
				setprop("/controls/armament/trigger-S8-1-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted2L) {
				setprop("/controls/armament/trigger-S8-2-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted3L) {
				setprop("/controls/armament/trigger-S8-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted4L) {
				setprop("/controls/armament/trigger-S8-4-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted5R) {
				setprop("/controls/armament/trigger-S8-5-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted6R) {
				setprop("/controls/armament/trigger-S8-6-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted7R) {
				setprop("/controls/armament/trigger-S8-7-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted8R) {
				setprop("/controls/armament/trigger-S8-8-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeft = (getprop("/controls/armament/rocketsLeft") -1);
			setprop("/controls/armament/rocketsCount", rocketsLeft);
			Rockets_Stop.start(0.1);
		}

		if((UB32mounted1L or UB32mounted2L or UB32mounted3L or UB32mounted4L or UB32mounted5R or UB32mounted6R or UB32mounted7R or UB32mounted8R) and RippleType ==2) {
			var fireTime = 0.75; #continuous fire for 0.15s intervals
			if(UB32mounted1L) {
				setprop("/controls/armament/trigger-S8-1-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted2L) {
				setprop("/controls/armament/trigger-S8-2-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted3L) {
				setprop("/controls/armament/trigger-S8-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted4L) {
				setprop("/controls/armament/trigger-S8-4-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted5R) {
				setprop("/controls/armament/trigger-S8-5-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted6R) {
				setprop("/controls/armament/trigger-S8-6-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted7R) {
				setprop("/controls/armament/trigger-S8-7-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted8R) {
				setprop("/controls/armament/trigger-S8-8-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeft = (getprop("/controls/armament/rocketsLeft") -2);
			setprop("/controls/armament/rocketsCount", rocketsLeft);
			Rockets_Ripple_2.start();
		}

		if((UB32mounted1L or UB32mounted2L or UB32mounted3L or UB32mounted4L or UB32mounted5R or UB32mounted6R or UB32mounted7R or UB32mounted8R) and RippleType ==3) {
			var fireTime = 0.75; #continuous fire for 0.15s intervals
			if(UB32mounted1L) {
				setprop("/controls/armament/trigger-S8-1-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted2L) {
				setprop("/controls/armament/trigger-S8-2-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted3L) {
				setprop("/controls/armament/trigger-S8-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted4L) {
				setprop("/controls/armament/trigger-S8-4-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted5R) {
				setprop("/controls/armament/trigger-S8-5-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted6R) {
				setprop("/controls/armament/trigger-S8-6-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted7R) {
				setprop("/controls/armament/trigger-S8-7-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted8R) {
				setprop("/controls/armament/trigger-S8-8-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeft = (getprop("/controls/armament/rocketsLeft") -4);
			setprop("/controls/armament/rocketsCount", rocketsLeft);
			Rockets_Ripple_4.start();
		}
	}
	
	else {
		setprop("/controls/armament/trigger1", 0);
		setprop("/controls/armament/trigger-S8-1-L", 0);
		setprop("/controls/armament/trigger-S8-2-L", 0);
		setprop("/controls/armament/trigger-S8-3-L", 0);
		setprop("/controls/armament/trigger-S8-4-L", 0);
		setprop("/controls/armament/trigger-S8-5-R", 0);
		setprop("/controls/armament/trigger-S8-6-R", 0);
		setprop("/controls/armament/trigger-S8-7-R", 0);
		setprop("/controls/armament/trigger-S8-8-R", 0);
		setprop("/sim/multiplay/generic/int[9]", 0);
		setprop("/controls/armament/rocketsLeft", 
			getprop("/controls/armament/rocketsCount"));#gets truncated
		interpolate("/controls/armament/rocketsCount", 
			getprop("/controls/armament/rocketsLeft"), 0);
		setprop("/controls/armament/rocketsLeftS13", 
			getprop("/controls/armament/rocketsCountS13"));#gets truncated
		interpolate("/controls/armament/rocketsCountS13", 
			getprop("/controls/armament/rocketsLeftS13"), 0);
		outOfAmmo.stop();
		outOfAmmoS13.stop();
		Rockets_Ripple_2.stop();
		Rockets_Ripple_4.stop();
		#ammo count report on trigger release
		if(getprop("/controls/armament/report-ammo"))
			screen.log.write("S-8 rockets left: " ~ getprop("/controls/armament/rocketsLeft") ~ ((getprop("/sim/weight[1]/payload-int") == 3 and  getprop("/sim/weight[8]/payload-int") == 3)?" x2":""), 1, 0.6, 0.1);
	}
}

setlistener("controls/armament/trigger1", triggerControl);


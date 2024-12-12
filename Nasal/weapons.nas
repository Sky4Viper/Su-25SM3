# for B-8M1
fire_Rocket = func {
                      setprop("/controls/armament/trigger1", 1);
			 }

stop_Rocket = func {
			    setprop("/controls/armament/trigger1", 0); 
			 }

Rreload = func {
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
	if( getprop("/gear/gear[0]/wow") and getprop("/gear/gear[1]/wow") and getprop("/gear/gear[2]/wow") and (getprop("/velocities/groundspeed-kt") < 2) ) {
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
	}
	else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

# Rreload = func {
# 		var UB32mounted1L = (getprop("/sim/weight[1]/payload-int") == 3);
# 		var UB32mounted2L = (getprop("/sim/weight[2]/payload-int") == 3);
# 		var UB32mounted3L = (getprop("/sim/weight[3]/payload-int") == 3);
# 		var UB32mounted4L = (getprop("/sim/weight[4]/payload-int") == 3);
# 		var UB32mounted5R = (getprop("/sim/weight[5]/payload-int") == 3);
# 		var UB32mounted6R = (getprop("/sim/weight[6]/payload-int") == 3);
# 		var UB32mounted7R = (getprop("/sim/weight[7]/payload-int") == 3);
# 		var UB32mounted8R = (getprop("/sim/weight[8]/payload-int") == 3);

# 		var BL13mounted3L = (getprop("/sim/weight[2]/payload-int") == 9);
# 		var BL13mounted4L = (getprop("/sim/weight[3]/payload-int") == 9);
# 		var BL13mounted7R = (getprop("/sim/weight[6]/payload-int") == 9);
# 		var BL13mounted8R = (getprop("/sim/weight[7]/payload-int") == 9);

# 		if(BL13mounted3L or BL13mounted4L or BL13mounted7R or BL13mounted8R) {
# 		setprop("/controls/armament/rocketsLeftS13", 5);
# 		setprop("/controls/armament/rocketsCountS13", 5);
# 		screen.log.write("BL-13 rocket pods reloaded (5 rockets per pod)", 1, 0.6, 0.1);
# 		}

# 		if(UB32mounted1L or UB32mounted2L or UB32mounted3L or UB32mounted4L or UB32mounted5R or UB32mounted6R or UB32mounted7R or UB32mounted8R) {
# 		setprop("/controls/armament/rocketsLeft", 20);
# 		setprop("/controls/armament/rocketsCount", 20);
# 		screen.log.write("B-8M1 rocket pods reloaded (20 rockets per pod)", 1, 0.6, 0.1);
# 		}

# 		else {
# 			return
# 		screen.log.write("No rocket pod loaded. Load rocket pods first!", 1, 0.6, 0.1);
# 		}
# }

var flash_trigger1 = props.globals.getNode("controls/armament/trigger1", 0);
var rockets_left = props.globals.initNode("/controls/armament/rocketsLeft", 0.0, "INT");
var rockets_count = props.globals.initNode("/controls/armament/rocketsCount", 0.0, "DOUBLE");
var rockets_leftS13 = props.globals.initNode("/controls/armament/rocketsLeftS13", 0.0, "INT");
var rockets_countS13 = props.globals.initNode("/controls/armament/rocketsCountS13", 0.0, "DOUBLE");

# for GSh-30-2
fire_MG = func {
	            setprop("/controls/armament/trigger", 1);
		   }

stop_MG = func {
			setprop("/controls/armament/trigger", 0); 
		   }

var flash_trigger = props.globals.getNode("controls/armament/trigger", 0);



# for Flares
var burst_quantity = 16.0;

fire_FL = func {
	            #setprop("/controls/armament/trigger2", 1);
			flare_burst1.start();
		   }

stop_FL = func {
			flare_burst1.stop();
			flare_burst2.stop();
			setprop("/controls/armament/trigger2", 0); 
		   }

var Freload = func {
		setprop("/controls/armament/flares_loaded", 240);
		screen.log.write("Flares reloaded (" ~ getprop("/controls/armament/flares_loaded") ~" flares)", 1, 0.6, 0.1);
}

var flash_trigger2 = props.globals.getNode("controls/armament/trigger2", 0);
var flares_loaded = props.globals.initNode("/controls/armament/flares_loaded", 240, "DOUBLE");


# for FAB-500

drop_Bomb = func {
	            setprop("/controls/armament/trigger3", 1);
		   }

stop_Bomb = func {
			setprop("/controls/armament/trigger3", 0); 
		   }

var flash_trigger3 = props.globals.getNode("controls/armament/trigger3", 0);


####timers ####

var flare_burst1 = maketimer(0.2, func()
{
if (getprop("/controls/armament/flares_loaded") > 0 and burst_quantity >0){
	#screen.log.write("Flare", 1, 0.6, 0.1);
	setprop("/controls/armament/trigger2", 1);
	setprop("/controls/armament/flares_loaded", getprop("/controls/armament/flares_loaded") - 4);
	burst_quantity = burst_quantity -4;
	flare_burst2.start();
	flare_burst1.stop();
}
else {
	#screen.log.write("Flares Out", 1, 0.6, 0.1);
	setprop("/controls/armament/trigger2", 0);
	switchclicksound.click("switch");
	burst_quantity = 16.0;
	flare_burst2.stop();
	flare_burst1.stop();
	}
});

var flare_burst2 = maketimer(0.2, func()
{
if (getprop("/controls/armament/trigger2") == 1){
	#screen.log.write("FlareStop", 1, 0.6, 0.1);
	setprop("/controls/armament/trigger2", 0);
	flare_burst1.start();
	flare_burst2.stop();
}
else {
	#screen.log.write("Flares Out", 1, 0.6, 0.1);
	setprop("/controls/armament/trigger2", 0);
	switchclicksound.click("switch");
	burst_quantity = 16.0;
	flare_burst1.stop();
	flare_burst2.stop();
	}
});


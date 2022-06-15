# for B-8M1
fire_Rocket = func {
                      setprop("/controls/armament/trigger1", 1);
			 }

stop_Rocket = func {
			    setprop("/controls/armament/trigger1", 0); 
			 }

Rreload = func {
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		screen.log.write("B-8M1 rocket pods reloaded (20 rockets per pod)", 1, 0.6, 0.1);
}

var flash_trigger1 = props.globals.getNode("controls/armament/trigger1", 0);
var rockets_left = props.globals.initNode("/controls/armament/rocketsLeft", 0.0, "INT");
var rockets_count = props.globals.initNode("/controls/armament/rocketsCount", 0.0, "DOUBLE");

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



#####################################################################################################################
##                                             WEAPONS CONTROL PANEL                                               ##
##                                                                                                                 ##
##  For Su-25, drops bombs in pairs starting from 2 outmost pylons base on quantity and                            ##
##  interval selctor switches in the cockpit:                                                                      ##
##                                                                                                                 ##
##  PO-0 -for singles, not yet implemented. Only 2 inboard should be able to release single to prevent unbalancing ##
##  PO-1 -release 1 pylon pair                                                                                     ##
##  PO-2 -release 2 pylon pairs                                                                                    ##
##  PO-4 -release 4 pylon pairs                                                                                    ##
##  ALL  -release all pylons                                                                                       ##
##                                                                                                                 ##
##  Intervals:                                                                                                     ##
##  SALVO      -release all selected without intervals                                                             ##
##  .01        -0.1 sec interval between releases                                                                  ##
##  .02        -0.2 sec interval between releases                                                                  ##
##  .03        -0.3 sec interval between releases                                                                  ##
##  .04        -0.4 sec interval between releases                                                                  ##
##  KMGD-MBD   -0.5 sec interval between releases, meant for bomb containers (not yet implemented)                 ##
##                                                                                                                 ##
#####################################################################################################################

#props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");
#initialize triggers
#props.globals.initNode("/controls/armament/trigger1", 0, "BOOL");
#props.globals.initNode("/controls/armament/pickle", 0, "BOOL");
#setprop("/controls/armament/trigger1", 0);
#setprop("/controls/armament/pickle", 0);

var release_int = getprop("controls/armament/releasei");
var release_step = getprop("controls/armament/releasei");


var FAB250_PO_ALL = func()
{
	#release_int = getprop("controls/armament/releasei");
	#release_step = getprop("controls/armament/releasei");
	
if (getprop("controls/armament/pickle") == 1 and getprop("controls/armament/masterarm") == 1 and getprop("controls/armament/selectedweapon") == 3)
{

	#Release FAB250 from pylons 1 and 8
	if (getprop("/sim/weight[1]/payload-int") == 4 and getprop("/sim/weight[8]/payload-int") == 4 and getprop("controls/armament/station[1]/release") != 1 and getprop("controls/armament/station[8]/release") != 1)
    {
		#screen.log.write("release interval: " ~release_int, 1, 0.6, 0.1);
		release250_1_8.singleShot = 1; # timer will only be run once
		release250_1_8.start();
	}

	#Release FAB250 from pylons 2 and 7
	if (getprop("/sim/weight[2]/payload-int") == 4 and getprop("/sim/weight[7]/payload-int") == 4 and getprop("controls/armament/station[2]/release") != 1 and getprop("controls/armament/station[7]/release") != 1)
    {
		#screen.log.write("release interval: " ~release_int, 1, 0.6, 0.1);
		release250_2_7.singleShot = 1; # timer will only be run once
		release250_2_7.start();
	}

	#Release FAB250 from pylons 3 and 6
	if (getprop("/sim/weight[3]/payload-int") == 4 and getprop("/sim/weight[6]/payload-int") == 4 and getprop("controls/armament/station[3]/release") != 1 and getprop("controls/armament/station[6]/release") != 1)
    {
		#screen.log.write("release interval: " ~release_int, 1, 0.6, 0.1);
		release250_3_6.singleShot = 1; # timer will only be run once
		release250_3_6.start();
	}

	#Release FAB250 from pylons 4 and 5
	if (getprop("/sim/weight[4]/payload-int") == 4 and getprop("/sim/weight[5]/payload-int") == 4 and getprop("controls/armament/station[4]/release") != 1 and getprop("controls/armament/station[5]/release") != 1)
    {
		#screen.log.write("release interval: " ~release_int, 1, 0.6, 0.1);
		release250_4_5.singleShot = 1; # timer will only be run once
		release250_4_5.start();
	}

	else {
		#screen.log.write("FAB-250 Out! ", 1, 0.6, 0.1);
		return;
	}
}

elsif (getprop("controls/armament/pickle") == 1 and getprop("controls/armament/masterarm") == 1 and getprop("controls/armament/selectedweapon") == 2)
	{
		#screen.log.write("Rockets! ", 1, 0.6, 0.1);
		setprop("/controls/armament/trigger1", 1);
	}

else {
		#screen.log.write("MasterArm Off! ", 1, 0.6, 0.1);
		setprop("/controls/armament/trigger1", 0);
		setprop("/controls/armament/pickle", 0);
		return;
	}
}

setlistener("controls/armament/pickle", FAB250_PO_ALL);

#timers########################################################################################################

var release250_1_8 = maketimer(1*getprop("controls/armament/releasei"), func(){
	setprop("controls/armament/station[1]/release", 1);
	setprop("controls/armament/station[8]/release", 1);
	print("Released FAB-250 from pylons 1 and 8" );
	setprop("/sim/weight[1]/selected", "none");
	setprop("/sim/weight[8]/selected", "none");
	setprop("sim/weight[1]/weight-lb", 0);
	setprop("sim/weight[8]/weight-lb", 0);
	setprop("controls/armament/pickle", 0);
	#screen.log.write("Pylons 1 and 8 released! ", 1, 0.6, 0.1);
	if (getprop("controls/armament/releaseq") <= 1)
	{
		release250_2_7.stop();
		release250_3_6.stop();
		release250_4_5.stop();
	}
	if (getprop("controls/armament/releaseq") <= 2)
	{
		release250_3_6.stop();
		release250_4_5.stop();
	}
});

var release250_2_7 = maketimer(2*getprop("controls/armament/releasei"), func(){
	setprop("controls/armament/station[2]/release", 1);
	setprop("controls/armament/station[7]/release", 1);
	print("Released FAB-250 from pylons 2 and 7" );
	setprop("/sim/weight[2]/selected", "none");
	setprop("/sim/weight[7]/selected", "none");
	setprop("sim/weight[2]/weight-lb", 0);
	setprop("sim/weight[7]/weight-lb", 0);
	setprop("controls/armament/pickle", 0);
	#screen.log.write("Pylons 2 and 7 released! ", 1, 0.6, 0.1);
	if (getprop("controls/armament/releaseq") <= 1)
	{
		release250_3_6.stop();
		release250_4_5.stop();
	}
	if (getprop("controls/armament/releaseq") <= 2)
	{
		release250_4_5.stop();
	}
});

var release250_3_6 = maketimer(3*getprop("controls/armament/releasei"), func(){
	setprop("controls/armament/station[3]/release", 1);
	setprop("controls/armament/station[6]/release", 1);
	print("Released FAB-250 from pylons 3 and 6" );
	setprop("/sim/weight[3]/selected", "none");
	setprop("/sim/weight[6]/selected", "none");
	setprop("sim/weight[3]/weight-lb", 0);
	setprop("sim/weight[6]/weight-lb", 0);
	setprop("controls/armament/pickle", 0);
	#screen.log.write("Pylons 3 and 6 released! ", 1, 0.6, 0.1);
	if (getprop("controls/armament/releaseq") <= 1)
	{
		release250_4_5.stop();
	}
});

var release250_4_5 = maketimer(4*getprop("controls/armament/releasei"), func(){
	setprop("controls/armament/station[4]/release", 1);
	setprop("controls/armament/station[5]/release", 1);
	print("Released FAB-250 from pylons 4 and 5" );
	setprop("/sim/weight[4]/selected", "none");
	setprop("/sim/weight[5]/selected", "none");
	setprop("sim/weight[4]/weight-lb", 0);
	setprop("sim/weight[5]/weight-lb", 0);
	setprop("controls/armament/pickle", 0);
	#screen.log.write("Pylons 4 and 5 released! ", 1, 0.6, 0.1);
});
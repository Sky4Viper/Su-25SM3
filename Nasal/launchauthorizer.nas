props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");
##########################################
# Primitive Range Finder for guns and Rockets
##########################################
props.globals.initNode("/controls/armament/LAMarkerON", 0, "BOOL");

var range = 0.0;
var LArange = 5500.0;
var LAmarkerON = 0;
var range_index = 0.0;
var dive_index = 0.0;
var pipper_offset = 0.001;
#var gun_powered = 0;
var master_arm = 0;
var selected_wpn = 0.0;
#var pylon1_load = 0.0;
#var pylon2_load = 0.0;
#var pylon3_load = 0.0;
#var pylon4_load = 0.0;
#var pylon5_load = 0.0;
var ac_pitch = 0.0;
var ac_alt = 0.0;
var is_bomb = 0.0;

var WeaponsHot = func{
var LAmarkerON = getprop("/controls/armament/LAMarkerON");
var selected_wpn = getprop("controls/armament/selectedweapon");
var master_arm = getprop("controls/armament/masterarm");
var ac_pitch = getprop("/orientation/pitch-deg");
var ac_alt = getprop("/position/altitude-agl-ft");
var sin_pitch = math.sin(-ac_pitch *D2R);
var range = ac_alt/sin_pitch;

if (master_arm == 1){
RangeSet.start();
}
else{
RangeSet.stop();
RangeTest.stop();
setprop("/controls/armament/LAMarkerON", 0);

}
}

########################### NOT YET CONNECTED

#get the current missile max launch range, and set it to a certain property
#var max_launch_range_finder = func() {
#	var cur_missile = getprop("payload/weight["~(payloads.pylon_select()[0])~"]/selected") ;
#	var min = getprop("payload/armament/" ~ cur_missile ~ "/min-fire-range-nm");
#	var max = getprop("payload/armament/" ~ cur_missile ~ "/max-fire-range-nm");
#	if ( min != nil ) {
#		setprop("instrumentation/hud/missile/min-launch-range",min);
#	}
#	if ( max != nil ) {
#		setprop("instrumentation/hud/missile/max-launch-range",max);
#	}
#	settimer( func { max_launch_range_finder(); }, 1);
#}

#meters to feet table *by3.281
#1000m=3280.84ft
#1500m=4921.26ft
#2000m=6561.68ft
#2500m=8202.1ft
#3000m=9842.52ft
#3500m=11482.94ft
#4000m=13123.36ft

setlistener("controls/armament/masterarm", WeaponsHot);


var RangeSet = maketimer (0.1, func()
{
#GSh-302 gun
if (getprop("controls/armament/selectedweapon") == 1){
LArange = 2500.0;
range_index = 0.05;
is_bomb = 0.0;
setprop("/controls/armament/larange", LArange);
RangeTest.start();
#screen.log.write("LA Range 2500", 1, 0.6, 0.1);
}
#Rockets
if (getprop("controls/armament/selectedweapon") == 2){
LArange = 4000.0;
range_index = 0.1;
is_bomb = 0.0;
setprop("/controls/armament/larange", LArange);
RangeTest.start();
#screen.log.write("LA Range 4000м", 1, 0.6, 0.1);
}
#FAB-250
if (getprop("controls/armament/selectedweapon") == 3){
LArange = 2500.0;
range_index = 0.6;
is_bomb = 1.4;
setprop("/controls/armament/larange", LArange);
RangeTest.start();
#screen.log.write("LA Range 3000м", 1, 0.6, 0.1);
}
#FAB-500
if (getprop("controls/armament/selectedweapon") == 4){
LArange = 2500.0;
range_index = 0.6;
is_bomb = 1.5;
setprop("/controls/armament/larange", LArange);
RangeTest.start();
#screen.log.write("LA Range 3000м", 1, 0.6, 0.1);
}
#Laser guided missile
if (getprop("controls/armament/selectedweapon") == 0){
LArange = 8000.0;
range_index = 0.0;
is_bomb = 0.0;
setprop("/controls/armament/larange", LArange);
RangeTest.start();
#screen.log.write("LA Range 8000м", 1, 0.6, 0.1);
}
#else{
#LArange = 5000.0;
#screen.log.write("Range Test OFF", 1, 0.6, 0.1);
#RangeTest.stop();
#}
});

var RangeTest = maketimer (0.02, func()
{
var ac_pitch = getprop("/orientation/pitch-deg");
var ac_alt = getprop("/position/altitude-agl-ft");
var sin_pitch = math.sin(-ac_pitch *D2R);
var range = ac_alt/sin_pitch/3.281;
var dive_index = is_bomb*(ac_pitch+90)/100;
var pipper_offset = range*0.00001*(range_index+dive_index);

if (ac_pitch < 0 and range < LArange and range < 15000.0){
setprop("/controls/armament/LAMarkerON", 1);
setprop("/controls/armament/laserrange", range);
setprop("/controls/armament/pipperoffset", pipper_offset);
#screen.log.write("In range", 1, 0.6, 0.1);
}
elsif (ac_pitch < 0 and range > LArange and range < 15000.0){
setprop("/controls/armament/laserrange", range);
setprop("/controls/armament/LAMarkerON", 0);
setprop("/controls/armament/pipperoffset", pipper_offset);
#screen.log.write("Laser ON", 1, 0.6, 0.1);
}
else{
setprop("/controls/armament/LAMarkerON", 0);
setprop("/controls/armament/laserrange", 0);
setprop("/controls/armament/pipperoffset", 0.001);
#screen.log.write("Range Test OFF", 1, 0.6, 0.1);
}
});

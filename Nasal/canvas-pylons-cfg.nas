var showPylonsDlg = func{
var (width,height) = (1400,500);
var title = 'Su-25SM3 Payload:';
setprop("/sim/menubar/visibility",0);
setprop("/controls/armament/roundsLeft", 250);
setprop("/controls/armament/roundsCount", 250);
 
# create a new window, dimensions are WIDTH x HEIGHT, using the dialog decoration (i.e. titlebar)
var window = canvas.Window.new([width,height],"dialog").set('title',title);
 
# adding a canvas to the new window and setting up background colors/transparency
var myCanvas = window.createCanvas().set("background", canvas.style.getColor("bg_color"));
 
# creating the top-level/root group which will contain all other elements/group
var root = myCanvas.createGroup();
 
# create a new layout for the dialog:
var mainVBox = canvas.VBoxLayout.new();
# assign the layout to the Canvas

myCanvas.setLayout(mainVBox);

var bgimage = root.createChild("image")
     .setFile("Aircraft/Su-25/Dialogs/Su-25-Pylons-BG.png")
	 #.setTranslation(100, 10)
     .setSize(1400,500);

var TopSpaceFiller = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0});
TopSpaceFiller.setText("")
.setFixedSize(697,210);

mainVBox.addItem(TopSpaceFiller);

var Hbox1 = canvas.HBoxLayout.new(); # Labels
mainVBox.addItem(Hbox1);

var Hbox2 = canvas.HBoxLayout.new(); # Weapons Buttons
mainVBox.addItem(Hbox2);

var Hbox3 = canvas.HBoxLayout.new(); # Fuel tanks
mainVBox.addItem(Hbox3);

var Hbox1RW = canvas.HBoxLayout.new(); # Right wing
Hbox1.addItem(Hbox1RW);

var Hbox1C = canvas.HBoxLayout.new(); # Specs
Hbox1.addItem(Hbox1C);

var Hbox1LW = canvas.HBoxLayout.new(); # Left wing
Hbox1.addItem(Hbox1LW);

### weapons ###

var P10Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P10Ctls);

var P9Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P9Ctls);

var P8Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P8Ctls);

var P7Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P7Ctls);

var P6Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P6Ctls);

var P5Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P5Ctls);

var P4Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P4Ctls);

var P3Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P3Ctls);

var P2Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P2Ctls);

var P1Ctls = canvas.VBoxLayout.new();
Hbox2.addItem(P1Ctls);

### Fuel tanks ###

var P10Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P10Ctls2);

var P9Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P9Ctls2);

var P8Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P8Ctls2);

var P7Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P7Ctls2);

var P6Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P6Ctls2);

var P5Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P5Ctls2);

var P4Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P4Ctls2);

var P3Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P3Ctls2);

var P2Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P2Ctls2);

var P1Ctls2 = canvas.VBoxLayout.new();
Hbox3.addItem(P1Ctls2);


# Labels

var Lbl_pyln10 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P10:"~getprop("sim/weight[9]/selected"))
	.setFixedSize(121, 25);
Hbox1RW.addItem(Lbl_pyln10);

var Lbl_pyln9 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P9:"~getprop("sim/weight[8]/selected"))
	.setFixedSize(121, 25);
Hbox1RW.addItem(Lbl_pyln9);

var Lbl_pyln8 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P8:"~getprop("sim/weight[7]/selected"))
	.setFixedSize(121, 25);
Hbox1RW.addItem(Lbl_pyln8);

var Lbl_pyln7 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P7:"~getprop("sim/weight[6]/selected"))
	.setFixedSize(121, 25);
Hbox1RW.addItem(Lbl_pyln7);

var Lbl_pyln6 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P6:"~getprop("sim/weight[5]/selected"))
	.setFixedSize(121, 25);
Hbox1RW.addItem(Lbl_pyln6);

var Lbl_pyln5 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P5:"~getprop("sim/weight[4]/selected"))
	.setFixedSize(121, 25);
Hbox1LW.addItem(Lbl_pyln5);

var Lbl_pyln4 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P4:"~getprop("sim/weight[3]/selected"))
	.setFixedSize(121, 25);
Hbox1LW.addItem(Lbl_pyln4);

var Lbl_pyln3 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P3:"~getprop("sim/weight[2]/selected"))
	.setFixedSize(121, 25);
Hbox1LW.addItem(Lbl_pyln3);

var Lbl_pyln2 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P2:"~getprop("sim/weight[1]/selected"))
	.setFixedSize(121, 25);
Hbox1LW.addItem(Lbl_pyln2);

var Lbl_pyln1 = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	.setText("P1:"~getprop("sim/weight/selected"))
	.setFixedSize(121, 25);
Hbox1LW.addItem(Lbl_pyln1);

var P3_PTB = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 1})
	# .setText("kg" ~ getprop("consumables/fuel/tank[4]/level-kg"))
	.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[4]/level-kg")))
	.setFixedSize(90, 25);
var P5_PTB = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 1} )
	# .setText("kg:" ~ getprop("consumables/fuel/tank[5]/level-kg"))
	.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[5]/level-kg")))
	.setFixedSize(90, 25);
var P6_PTB = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 1} )
	# .setText("kg:" ~ getprop("consumables/fuel/tank[6]/level-kg"))
	.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[6]/level-kg")))
	.setFixedSize(90, 25);
var P8_PTB = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 1} )
	# .setText("kg:" ~ getprop("consumables/fuel/tank[7]/level-kg"))
	.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[7]/level-kg")))
	.setFixedSize(90, 25);
var TotalFuelKg = canvas.gui.widgets.Label.new(root, canvas.style, {} )
	#.setText("Total Fuel (kg):" ~ getprop("consumables/fuel/total-fuel-kg"))
	.setText(sprintf("Total Fuel (kg): %4d", getprop("consumables/fuel/total-fuel-kg")))
	.setFixedSize(200, 25);




var pylons_update = func{
	Lbl_pyln1.setText("P1: "~getprop("sim/weight/selected"));
	Lbl_pyln2.setText("P2: "~getprop("sim/weight[1]/selected"));
	Lbl_pyln3.setText("P3: "~getprop("sim/weight[2]/selected"));
	Lbl_pyln4.setText("P4: "~getprop("sim/weight[3]/selected"));
	Lbl_pyln5.setText("P5: "~getprop("sim/weight[4]/selected"));
	Lbl_pyln6.setText("P6: "~getprop("sim/weight[5]/selected"));
	Lbl_pyln7.setText("P7: "~getprop("sim/weight[6]/selected"));
	Lbl_pyln8.setText("P8: "~getprop("sim/weight[7]/selected"));
	Lbl_pyln9.setText("P9: "~getprop("sim/weight[8]/selected"));
	Lbl_pyln10.setText("P10: "~getprop("sim/weight[9]/selected"));

	P3_PTB.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[4]/level-kg")));
	P5_PTB.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[5]/level-kg")));
	P6_PTB.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[6]/level-kg")));
	P8_PTB.setText(sprintf("kg: %3d", getprop("consumables/fuel/tank[7]/level-kg")));
	TotalFuelKg.setText(sprintf("Total Fuel (kg): %4d", getprop("consumables/fuel/total-fuel-kg")));
	}

#sim/weight[0]/weight-lb
#sim/weight[1]/weight-lb
#sim/weight[2]/weight-lb
#sim/weight[3]/weight-lb
#sim/weight[4]/weight-lb
#sim/weight[5]/weight-lb
#sim/weight[6]/weight-lb
#sim/weight[7]/weight-lb
#sim/weight[8]/weight-lb
#sim/weight[9]/weight-lb
	
###############################
######### Pylon1 ##############	
###############################


# click button P1:none
var btn_P1_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P1_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P1: none");
		setprop("sim/weight/selected","none");
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs",0.0);
		pylons_update();
		});
P1Ctls.addItem(btn_P1_empty);

# click button P1:R-60
var btn_P1_R60 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("R-60M")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P1_R60.listen("clicked", func {
        # add code here to react on click on button.
		print("P1: R-60M");
		setprop("sim/weight/selected","R-60M");
		setprop("sim/weight/weight-lb",96);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs",96); # R-60 = 43.5 kg (96 lb)
		pylons_update();
		});
P1Ctls.addItem(btn_P1_R60);

# click button P1:L-370-3S
var btn_P1_L3703S = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("L-370-3S")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P1_L3703S.listen("clicked", func {
        # add code here to react on click on button.
		print("P1: L-370-3S");
		setprop("sim/weight/selected","L-370-3S pod");
		setprop("sim/weight/weight-lb",96);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs",96); # set the same weight as R-60 for now
		pylons_update();
		});
P1Ctls.addItem(btn_P1_L3703S);


###############################
######### Pylon2 ##############
###############################


# click button P2:none
var btn_P2_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P2_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P2: none");
		setprop("sim/weight[1]/selected","none");
		setprop("sim/weight[1]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[1]",0.0);
		pylons_update();
		});
P2Ctls.addItem(btn_P2_empty);

# click button P2:UB-32

#var btn_P2_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
#        .setText("B-8M1")
#        .setCheckable(1) # this indicates that is should be a toggle button
#        .setChecked(0) # depressed by default
#        .setFixedSize(90, 25);

#btn_P2_UB32.listen("toggled", func (e) {
#        if( e.detail.checked ) {
#		print("P2: B-8M1");
#		setprop("sim/weight[1]/selected","S-8 rockets");
#		setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[1]",580); # KG
#		pylons_update();
#        } else {
#		print("P2: none");
#		setprop("sim/weight[1]/selected","none");
#		setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[1]",0.0);
#		pylons_update();
#        }
#    });

var btn_P2_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P2_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P2: B-8M1");
		setprop("sim/weight[1]/selected","S-8 rockets");
		setprop("sim/weight[1]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[1]",580);  # need to change to B-8M1(empty weight 160kg, 20 tubes)
		pylons_update();
		});
P2Ctls.addItem(btn_P2_UB32);

# click button P2:FAB-250
var btn_P2_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P2_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P2: FAB-250");
		setprop("sim/weight[1]/selected","FAB-250 bomb");
		setprop("sim/weight[1]/weight-lb",590);
		setprop("controls/armament/station[1]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[1]",590); # KG
		pylons_update();
		});
P2Ctls.addItem(btn_P2_FAB250);

###############################
######### Pylon3 ##############
###############################

# click button P3:none
var btn_P3_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P3_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P3: none");
		setprop("/consumables/fuel/tank[4]/selected", 0);
		setprop("/consumables/fuel/tank[4]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[4]/level-gal_us", 0.0);
		setprop("sim/weight[2]/selected","none");
		setprop("sim/weight[2]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[2]",0.0);
		pylons_update();
		});
P3Ctls.addItem(btn_P3_empty);

# click button P3:UB-32
var btn_P3_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P3_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P3: B-8M1");
		setprop("/consumables/fuel/tank[4]/selected", 0);
		setprop("/consumables/fuel/tank[4]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[4]/level-gal_us", 0.0);
		setprop("sim/weight[2]/selected","S-8 rockets");
		setprop("sim/weight[2]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[2]",580); # KG
		pylons_update();
		});
P3Ctls.addItem(btn_P3_UB32);

# click button P3:FAB-250
var btn_P3_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P3_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P3: FAB-250");
		setprop("/consumables/fuel/tank[4]/selected", 0);
		setprop("/consumables/fuel/tank[4]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[4]/level-gal_us", 0.0);
		setprop("sim/weight[2]/selected","FAB-250 bomb");
		setprop("sim/weight[2]/weight-lb",590);
		setprop("controls/armament/station[2]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[2]",590); # KG
		pylons_update();
		});
P3Ctls.addItem(btn_P3_FAB250);

# click button P3:Kh-25
var btn_P3_KH25 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("Kh-25")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P3_KH25.listen("clicked", func {
        # add code here to react on click on button.
		print("P3: Kh-25");
		setprop("/consumables/fuel/tank[4]/selected", 0);
		setprop("/consumables/fuel/tank[4]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[4]/level-gal_us", 0.0);
		setprop("sim/weight[2]/selected","Kh-25 missile");
		setprop("sim/weight[2]/weight-lb",659);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[2]",659); # Kh-25ML :299 kg (659 lb) and Kh-25MP :315 kg (694 lb)
		pylons_update();
		});
P3Ctls.addItem(btn_P3_KH25);

# click button P3:BL-13
var btn_P3_BL13 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("BL-13")
        .setFixedSize(90, 25);

btn_P3_BL13.listen("clicked", func {
        # add code here to react on click on button.
		print("P3: BL-13");
		setprop("sim/weight[2]/selected","S-13 rockets");
		setprop("sim/weight[2]/weight-lb",1102);
		setprop("/controls/armament/rocketsLeftS13", 5);
		setprop("/controls/armament/rocketsCountS13", 5);
		pylons_update();
		});
P3Ctls.addItem(btn_P3_BL13);

# click button P3:PTB-800
var btn_P3_PTB800 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("PTB-800")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P3_PTB800.listen("clicked", func {
        # add code here to react on click on button.
		print("P3: PTB-800");
		#setprop("sim/weight[2]/selected","Fuel droptank");
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[3]",308.647);
		setprop("/sim/weight[2]/selected","Fuel droptank");
		setprop("sim/weight[2]/weight-lb",308.647);
		setprop("/consumables/fuel/tank[4]/selected", 1);
		setprop("/consumables/fuel/tank[4]/capacity-gal_us", 211.34);
		setprop("/consumables/fuel/tank[4]/level-gal_us", 211.34);
		pylons_update();
		});
P3Ctls2.addItem(btn_P3_PTB800);

# Total added weight per FULL tank is 760 KG, total added fuel weight per FULL tank is 620 KG (140KG for empty tank 308.647 lb, US Gallons = 211.34)
# Empty weight: 9315 кг (20536.06 lb)
# Loaded weight: 11 600 кг (25573.622 lb)
# Normal takeoff weight: 14 600 кг (32187.49 lb)
# Max takeoff weight: 17 600 кг (38801.358 lb)
# Internal fuel weight: 3000 кг (6613.868 lb)

###############################
######### Pylon4 ##############
###############################

# click button P4:none
var btn_P4_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P4_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P4: none");
		setprop("sim/weight[3]/selected","none");
		setprop("sim/weight[3]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[3]",0.0);
		pylons_update();
		});
P4Ctls.addItem(btn_P4_empty);

# click button P4:UB-32
var btn_P4_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P4_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P4: B-8M1");
		setprop("sim/weight[3]/selected","S-8 rockets");
		setprop("sim/weight[3]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[3]",580); # KG
		pylons_update();
		});
P4Ctls.addItem(btn_P4_UB32);

# click button P4:FAB-250
var btn_P4_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P4_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P4: FAB-250");
		setprop("sim/weight[3]/selected","FAB-250 bomb");
		setprop("sim/weight[3]/weight-lb",590);
		setprop("controls/armament/station[3]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[3]",590); # KG
		pylons_update();
		});
P4Ctls.addItem(btn_P4_FAB250);

# click button P4:Kh-25
var btn_P4_KH25 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("Kh-25")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P4_KH25.listen("clicked", func {
        # add code here to react on click on button.
		print("P4: Kh-25");
		setprop("sim/weight[3]/selected","Kh-25 missile");
		setprop("sim/weight[3]/weight-lb",659);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[3]",659); # KG
		pylons_update();
		});
P4Ctls.addItem(btn_P4_KH25);

# click button P3:BL-13
var btn_P4_BL13 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("BL-13")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P4_BL13.listen("clicked", func {
        # add code here to react on click on button.
		print("P4: BL-13");
		setprop("sim/weight[3]/selected","S-13 rockets");
		setprop("sim/weight[3]/weight-lb",1102);
		setprop("/controls/armament/rocketsLeftS13", 5);
		setprop("/controls/armament/rocketsCountS13", 5);
		pylons_update();
		});
P4Ctls.addItem(btn_P4_BL13);

###############################
######### Pylon5 ##############
###############################

# click button P5:none
var btn_P5_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P5_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P5: none");
		setprop("sim/weight[4]/selected","none");
		setprop("sim/weight[4]/weight-lb",0.0);
		setprop("/consumables/fuel/tank[5]/selected", 0);
		setprop("/consumables/fuel/tank[5]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[5]/level-gal_us", 0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[4]",0.0);
		pylons_update();
		});
P5Ctls.addItem(btn_P5_empty);

# click button P5:UB-32
var btn_P5_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P5_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P5: B-8M1");
		setprop("/consumables/fuel/tank[5]/selected", 0);
		setprop("/consumables/fuel/tank[5]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[5]/level-gal_us", 0.0);
		setprop("sim/weight[4]/selected","S-8 rockets");
		setprop("sim/weight[4]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[4]",580); # KG
		pylons_update();
		});
P5Ctls.addItem(btn_P5_UB32);

# click button P5:FAB-250
var btn_P5_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P5_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P5: FAB-250");
		setprop("/consumables/fuel/tank[5]/selected", 0);
		setprop("/consumables/fuel/tank[5]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[5]/level-gal_us", 0.0);
		setprop("sim/weight[4]/selected","FAB-250 bomb");
		setprop("sim/weight[4]/weight-lb",590);
		setprop("controls/armament/station[4]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[4]",590); # KG
		pylons_update();
		});
P5Ctls.addItem(btn_P5_FAB250);

# click button P5:KAB-500L
var btn_P5_KAB500L = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("KAB-500L")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P5_KAB500L.listen("clicked", func {
        # add code here to react on click on button.
		print("P5: KAB-500L");
		setprop("/consumables/fuel/tank[5]/selected", 0);
		setprop("/consumables/fuel/tank[5]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[5]/level-gal_us", 0.0);
		setprop("sim/weight[4]/selected","KAB-500L bomb");
		setprop("sim/weight[4]/weight-lb",1157);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[4]",1157); # KG
		pylons_update();
		});
P5Ctls.addItem(btn_P5_KAB500L);

# click button P5:Kh-29T
var btn_P5_KH29T = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("Kh-29T")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P5_KH29T.listen("clicked", func {
        # add code here to react on click on button.
		print("P5: Kh-29T");
		setprop("/consumables/fuel/tank[5]/selected", 0);
		setprop("/consumables/fuel/tank[5]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[5]/level-gal_us", 0.0);
		setprop("sim/weight[4]/selected","Kh-29T missile");
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[4]",1512); # KG
		pylons_update();
		});
P5Ctls.addItem(btn_P5_KH29T);

# click button P5:PTB-800
var btn_P5_PTB800 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("PTB-800")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P5_PTB800.listen("clicked", func {
        # add code here to react on click on button.
		print("P5: PTB-800");
		setprop("/sim/weight[4]/selected","Fuel droptank");
		setprop("sim/weight[4]/weight-lb",308.647);
		setprop("/consumables/fuel/tank[5]/selected", 1);
		setprop("/consumables/fuel/tank[5]/capacity-gal_us", 211.34);
		setprop("/consumables/fuel/tank[5]/level-gal_us", 211.34);
		pylons_update();
		});
P5Ctls2.addItem(btn_P5_PTB800);

###############################
######### Pylon6 ##############
###############################

# click button P6:none
var btn_P6_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P6_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P6: none");
		setprop("sim/weight[5]/selected","none");
		setprop("sim/weight[5]/weight-lb",0.0);
		setprop("/consumables/fuel/tank[6]/selected", 0);
		setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[6]/level-gal_us", 0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[5]",0.0);
		pylons_update();
		});
P6Ctls.addItem(btn_P6_empty);

# click button P6:UB-32
var btn_P6_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P6_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P6: B-8M1");
		setprop("/consumables/fuel/tank[6]/selected", 0);
		setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[6]/level-gal_us", 0.0);
		setprop("sim/weight[5]/selected","S-8 rockets");
		setprop("sim/weight[5]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[5]",580); # KG
		pylons_update();
		});
P6Ctls.addItem(btn_P6_UB32);

# click button P6:FAB-250
var btn_P6_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P6_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P6: FAB-250");
		setprop("/consumables/fuel/tank[6]/selected", 0);
		setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[6]/level-gal_us", 0.0);
		setprop("sim/weight[5]/selected","FAB-250 bomb");
		setprop("sim/weight[5]/weight-lb",590);
		setprop("controls/armament/station[5]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[5]",590); # KG
		pylons_update();
		});
P6Ctls.addItem(btn_P6_FAB250);

# click button P6:KAB-500L
var btn_P6_KAB500L = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("KAB-500L")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P6_KAB500L.listen("clicked", func {
        # add code here to react on click on button.
		print("P6: KAB-500L");
		setprop("/consumables/fuel/tank[6]/selected", 0);
		setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[6]/level-gal_us", 0.0);
		setprop("sim/weight[5]/selected","KAB-500L bomb");
		setprop("sim/weight[5]/weight-lb",1157);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[5]",1157); # KG
		pylons_update();
		});
P6Ctls.addItem(btn_P6_KAB500L);

# click button P6:Kh-29T
var btn_P6_KH29T = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("Kh-29T")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P6_KH29T.listen("clicked", func {
        # add code here to react on click on button.
		print("P6: Kh-29T");
		setprop("/consumables/fuel/tank[6]/selected", 0);
		setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[6]/level-gal_us", 0.0);
		setprop("sim/weight[5]/selected","Kh-29T missile");
		setprop("sim/weight[5]/weight-lb",1512);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[5]",1512); # KG
		pylons_update();
		});
P6Ctls.addItem(btn_P6_KH29T);

# click button P6:PTB-800
var btn_P6_PTB800 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("PTB-800")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P6_PTB800.listen("clicked", func {
        # add code here to react on click on button.
		print("P6: PTB-800");
		setprop("/sim/weight[5]/selected","Fuel droptank");
		setprop("sim/weight[5]/weight-lb",308.647);
		setprop("/consumables/fuel/tank[6]/selected", 1);
		setprop("/consumables/fuel/tank[6]/capacity-gal_us", 211.34);
		setprop("/consumables/fuel/tank[6]/level-gal_us", 211.34);
		pylons_update();
		});
P6Ctls2.addItem(btn_P6_PTB800);

###############################
######### Pylon7 ##############
###############################

# click button P7:none
var btn_P7_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P7_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P7: none");
		setprop("sim/weight[6]/selected","none");
		setprop("sim/weight[6]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[6]",0.0);
		pylons_update();
		});
P7Ctls.addItem(btn_P7_empty);

# click button P7:UB-32
var btn_P7_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P7_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P7: B-8M1");
		setprop("sim/weight[6]/selected","S-8 rockets");
		setprop("sim/weight[6]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[6]",580); # KG
		pylons_update();
		});
P7Ctls.addItem(btn_P7_UB32);

# click button P7:FAB-250
var btn_P7_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P7_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P7: FAB-250");
		setprop("sim/weight[6]/selected","FAB-250 bomb");
		setprop("sim/weight[6]/weight-lb",590);
		setprop("controls/armament/station[6]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[6]",590); # KG
		pylons_update();
		});
P7Ctls.addItem(btn_P7_FAB250);

# click button P7:Kh-25
var btn_P7_KH25 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("Kh-25")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P7_KH25.listen("clicked", func {
        # add code here to react on click on button.
		print("P7: Kh-25");
		setprop("sim/weight[6]/selected","Kh-25 missile");
		setprop("sim/weight[6]/weight-lb",659);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[6]",659); # KG
		pylons_update();
		});
P7Ctls.addItem(btn_P7_KH25);

# click button P7:BL-13
var btn_P7_BL13 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("BL-13")
        .setFixedSize(90, 25);

btn_P7_BL13.listen("clicked", func {
        # add code here to react on click on button.
		print("P7: BL-13");
		setprop("sim/weight[6]/selected","S-13 rockets");
		setprop("sim/weight[6]/weight-lb",1102);
		setprop("/controls/armament/rocketsLeftS13", 5);
		setprop("/controls/armament/rocketsCountS13", 5);
		pylons_update();
		});
P7Ctls.addItem(btn_P7_BL13);

###############################
######### Pylon8 ##############
###############################

# click button P8:none
var btn_P8_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P8_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P8: none");
		setprop("/consumables/fuel/tank[7]/selected", 0);
		setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[7]/level-gal_us", 0.0);
		setprop("sim/weight[7]/selected","none");
		setprop("sim/weight[7]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[7]",0.0);
		pylons_update();
		});
P8Ctls.addItem(btn_P8_empty);

# click button P8:UB-32
var btn_P8_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P8_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P8: B-8M1");
		setprop("/consumables/fuel/tank[7]/selected", 0);
		setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[7]/level-gal_us", 0.0);
		setprop("sim/weight[7]/selected","S-8 rockets");
		setprop("sim/weight[7]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[7]",580); # KG
		pylons_update();
		});
P8Ctls.addItem(btn_P8_UB32);

# click button P8:FAB-250
var btn_P8_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P8_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P8: FAB-250");
		setprop("/consumables/fuel/tank[7]/selected", 0);
		setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[7]/level-gal_us", 0.0);
		setprop("sim/weight[7]/selected","FAB-250 bomb");
		setprop("sim/weight[7]/weight-lb",590);
		setprop("controls/armament/station[7]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[7]",590); # KG
		pylons_update();
		});
P8Ctls.addItem(btn_P8_FAB250);

# click button P8:Kh-25
var btn_P8_KH25 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("Kh-25")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P8_KH25.listen("clicked", func {
        # add code here to react on click on button.
		print("P8: Kh-25");
		setprop("/consumables/fuel/tank[7]/selected", 0);
		setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0.0);
		setprop("/consumables/fuel/tank[7]/level-gal_us", 0.0);
		setprop("sim/weight[7]/selected","Kh-25 missile");
		setprop("sim/weight[7]/weight-lb",659);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[7]",659); # KG
		pylons_update();
		});
P8Ctls.addItem(btn_P8_KH25);

# click button P8:BL-13
var btn_P8_BL13 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("BL-13")
        .setFixedSize(90, 25);

btn_P8_BL13.listen("clicked", func {
        # add code here to react on click on button.
		print("P8: BL-13");
		setprop("sim/weight[7]/selected","S-13 rockets");
		setprop("sim/weight[7]/weight-lb",1102);
		setprop("/controls/armament/rocketsLeftS13", 5);
		setprop("/controls/armament/rocketsCountS13", 5);
		pylons_update();
		});
P8Ctls.addItem(btn_P8_BL13);

# click button P8:PTB-800
var btn_P8_PTB800 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("PTB-800")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P8_PTB800.listen("clicked", func {
        # add code here to react on click on button.
		print("P8: PTB-800");
		setprop("/sim/weight[7]/selected","Fuel droptank");
		setprop("sim/weight[7]/weight-lb",308.647);
		setprop("/consumables/fuel/tank[7]/selected", 1);
		setprop("/consumables/fuel/tank[7]/capacity-gal_us", 211.34);
		setprop("/consumables/fuel/tank[7]/level-gal_us", 211.34);
		pylons_update();
		});
P8Ctls2.addItem(btn_P8_PTB800);

###############################
######### Pylon9 ##############
###############################

# click button P9:none
var btn_P9_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P9_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P9: none");
		setprop("sim/weight[8]/selected","none");
		setprop("sim/weight[8]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[8]",0.0);
		pylons_update();
		});
P9Ctls.addItem(btn_P9_empty);

# click button P9:UB-32
var btn_P9_UB32 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("B-8M1")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P9_UB32.listen("clicked", func {
        # add code here to react on click on button.
		print("P9: B-8M1");
		setprop("sim/weight[8]/selected","S-8 rockets");
		setprop("sim/weight[8]/weight-lb",580);
		setprop("/controls/armament/rocketsLeft", 20);
		setprop("/controls/armament/rocketsCount", 20);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[8]",580); # KG
		pylons_update();
		});
P9Ctls.addItem(btn_P9_UB32);

# click button P9:FAB-250
var btn_P9_FAB250 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("FAB-250")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P9_FAB250.listen("clicked", func {
        # add code here to react on click on button.
		print("P9: FAB-250");
		setprop("sim/weight[8]/selected","FAB-250 bomb");
		setprop("sim/weight[8]/weight-lb",590);
		setprop("controls/armament/station[8]/release",0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[8]",590); # KG
		pylons_update();
		});
P9Ctls.addItem(btn_P9_FAB250);


###############################
######### Pylon10 #############	
###############################

# click button P10:none
var btn_P10_empty = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("none")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P10_empty.listen("clicked", func {
        # add code here to react on click on button.
		print("P10: none");
		setprop("sim/weight[9]/selected","none");
		setprop("sim/weight[9]/weight-lb",0.0);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs[9]",0.0);
		pylons_update();
		});
P10Ctls.addItem(btn_P10_empty);

# click button P10:R-60
var btn_P10_R60 = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("R-60M")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P10_R60.listen("clicked", func {
        # add code here to react on click on button.
		print("P10: R-60M");
		setprop("sim/weight[9]/selected","R-60M");
		setprop("sim/weight[9]/weight-lb",96);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs",96); # R-60 = 43.5 kg (96 lb)
		pylons_update();
		});
P10Ctls.addItem(btn_P10_R60);

# click button P10:L-370-3S
var btn_P10_L3703S = canvas.gui.widgets.Button.new(root, canvas.style, {})
        .setText("L-370-3S")
        #.move(300, 300)
        .setFixedSize(90, 25);

btn_P10_L3703S.listen("clicked", func {
        # add code here to react on click on button.
		print("P10: L-370-3S");
		setprop("sim/weight[9]/selected","L-370-3S pod");
		setprop("sim/weight[9]/weight-lb",96);
		#setprop("fdm/jsbsim/inertia/pointmass-weight-lbs",96); # set the same weight as R-60 for now
		pylons_update();
		});
P10Ctls.addItem(btn_P10_L3703S);

# spacers
var SpaceFiller=canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0});
SpaceFiller.setText("")
.setFixedSize(90, 25);

P10Ctls.addItem(SpaceFiller);
P10Ctls.addItem(SpaceFiller);

P9Ctls.addItem(SpaceFiller);
P9Ctls.addItem(SpaceFiller);

#P8Ctls.addItem(SpaceFiller);

#P7Ctls.addItem(SpaceFiller);

#P4Ctls.addItem(SpaceFiller);

#P3Ctls.addItem(SpaceFiller);

P2Ctls.addItem(SpaceFiller);
P2Ctls.addItem(SpaceFiller);

#P1Ctls.addItem(SpaceFiller);
P1Ctls.addItem(SpaceFiller);
P1Ctls.addItem(SpaceFiller);

###

P10Ctls2.addItem(SpaceFiller);
P9Ctls2.addItem(P8_PTB);
P7Ctls2.addItem(P6_PTB);
P4Ctls2.addItem(P5_PTB);
P2Ctls2.addItem(P3_PTB);
P1Ctls2.addItem(SpaceFiller);

####info####
var statusbar =canvas.HBoxLayout.new();
mainVBox.addItem(statusbar);

statusbar.addItem(TotalFuelKg);

#statusbar.addItem(P8_PTB);
#statusbar.addItem(P6_PTB);
#statusbar.addItem(P5_PTB);
#statusbar.addItem(P3_PTB);

#var version=canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0});
#version.setText("FlightGear v" ~ getprop("/sim/version/flightgear"));
#statusbar.addItem(version);

#var AircraftName=canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0});
#AircraftName.setText("                  Su-25SM3");
#statusbar.addItem(AircraftName);

#var AircraftDeveloper=canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0});
#AircraftDeveloper.setText("                  Sergei Solyshko, 2021");
#statusbar.addItem(AircraftDeveloper);



}

# Victor Engines - modified by Algernon from generic-yasim-engine.nas 
# -- a generic Nasal-based engine control system for YASim
# Version 1.0.0
#
# Copyright (C) 2011  Ryan Miller
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

var UPDATE_PERIOD = 0; # update interval for engine init() functions

print("Loading YASim Engine Script...");

# jet engine class
var Jet =
{
	# creates a new engine object
	new: func(n, running = 0, idle_throttle = 0.01, max_start_n1 = 5.21, start_threshold = 3, spool_time = 4, start_time = 0.02, shutdown_time = 4,) 
	{
		# copy the Jet object
		var m = { parents: [Jet] };
		# declare object variables
		m.number = n;
		m.name = "Engine " ~ ( n + 1 );
		m.autostart_status = 0;
		m.autostart_id = -1;
		m.loop_running = 0;
		m.started = 0;
		m.starting = 0;
		m.idle_throttle = idle_throttle;
		m.max_start_n1 = max_start_n1;
		m.start_threshold = start_threshold;
		m.spool_time = spool_time;
		m.start_time = start_time;
		m.shutdown_time = shutdown_time;
		m.overspeed_rpm = 125; # 111
		m.failure_prob = 0.001;
		# create references to properties and set default values
		m.cutoff = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/cutoff", 1);
		m.cutoff.setBoolValue(!running);
		m.HPcock = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/HP-cock", 1);
		m.HPcock.setBoolValue(0);
		m.LPcock = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/LP-cock", 1);
		m.LPcock.setBoolValue(0);
		m.fuelboost = props.globals.getNode("controls/switches/boost-pump[" ~ n ~ "]", 1);
		m.fuelboost.setValue(0);
		m.n1 = props.globals.getNode("engines/engine[" ~ n ~ "]/n1", 1);
		m.n1.setDoubleValue(0);
		m.out_of_fuel = props.globals.getNode("engines/engine[" ~ n ~ "]/out-of-fuel", 1);
		m.out_of_fuel.setBoolValue(0);
		m.reverser = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/reverser", 1);
		m.reverser.setBoolValue(0);
		m.rpm = props.globals.getNode("engines/engine[" ~ n ~ "]/rpm", 1);
		m.rpm.setDoubleValue(running ? 100 : 0);
		m.running = props.globals.getNode("engines/engine[" ~ n ~ "]/running", 1);
		m.running.setBoolValue(running);
		m.serviceable = props.globals.getNode("engines/engine[" ~ n ~ "]/serviceable", 1);
		m.serviceable.setBoolValue(1);
		m.starter = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/starter", 1);
		m.starter.setBoolValue(0);
		m.state = props.globals.getNode("engines/engine[" ~ n ~ "]/state",1 );
		m.state.setIntValue(0);
		m.sip = props.globals.getNode("engines/engine[" ~ n ~ "]/start-in-progress", 1);
        m.sip.setBoolValue();
		m.throttle = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/throttle", 1);
		m.throttle.setDoubleValue(0);
		m.throttle_lever = props.globals.getNode("controls/engines/engine[" ~ n ~ "]/throttle-lever", 1);
		m.throttle_lever.setDoubleValue(0);
		m.overspeed = props.globals.getNode("engines/engine[" ~ n ~ "]/overspeed",1);
		m.overspeed.setBoolValue(0);
		m.dambase = props.globals.getNode("sim/damage/damage-zones/engine[" ~ n ~"]",1);
		m.damage = m.dambase.getNode("damage-norm", 1);
		m.damage.setValue(0);
		m.powerloss = m.dambase.getNode("power-loss-norm", 1);
		m.powerloss.setValue(0);
		m.smoking = m.dambase.getNode("smoke-norm", 1);
		m.smoking.setValue(0);
		m.fire = m.dambase.getNode("fire", 1);
		m.fire.setValue(0);
		m.stable = m.dambase.getNode("stable", 1);
		m.stable.setBoolValue(1);
		m.explosion = m.dambase.getNode("explosion", 1);
		m.explosion.setValue(0);
		m.mpexplosion = m.dambase.getNode("mp-explosion", 1);
		m.mpexplosion.setBoolValue(0);
		# return our new object
		return m;
	},
	
    # engine-specific autostart
	autostart: func
	{
		if (me.autostart_status)
		{
			me.autostart_status = 0;
			me.cutoff.setBoolValue(1);
		}
		else
		{
			me.autostart_status = 1;
			me.starter.setBoolValue(1);
			settimer(func
			{
				me.cutoff.setBoolValue(0);
			}, me.max_start_n1 / me.start_time);
		}
	},
	# creates an engine update loop (optional)
	init: func
	{
	    props.globals.getNode("engines/engine["~me.number~"]/serviceable",1).alias("/sim/failure-manager/engines/engine["~me.number~"]/serviceable");
		
		setlistener("/sim/damage/damage-zones/engine["~me.number~"]/damage-norm", func { me.fail_check(); } );
		
		if (me.loop_running) return;
		me.loop_running = 1;
		var loop = func
		{
			me.update();
			
			settimer(loop, UPDATE_PERIOD);
		};
		var fail_loop = func {
		     me.fail_check();
			 # Debug
			 # print("Failure Probability: "~ me.failure_prob);
			 settimer(fail_loop, 10);
			}
			
		settimer(loop, 0);
		settimer(fail_loop, 0);
	},
	# updates the engine
	update: func {

        me.smoking.setValue( ( me.damage.getValue() * 0.55 ) * ( me.rpm.getValue() * 0.009 ) + ( me.explosion.getValue() * 2 ) + ( me.fire.getValue() * 0.6 ) );
	
		
		
		if (me.running.getBoolValue() and !me.started)
		{
			me.running.setBoolValue(0);
			#me.state.setIntValue(0);
		}
		
		if ( !me.running.getBoolValue() and me.starter.getBoolValue() ) {
			 
			 if ( ( me.rpm.getValue() > 0.4 ) and ( me.rpm.getValue() <50 ) ) { 
			     me.sip.setBoolValue(1);
				 me.state.setIntValue(1);
				}
				
			else {
			     me.sip.setBoolValue(0);
				 me.state.setIntValue(0);
			    }
			}
	
		else {
		     me.sip.setBoolValue(0);
		}
		
		if (me.cutoff.getBoolValue() or !me.serviceable.getBoolValue() or me.out_of_fuel.getBoolValue())
		{
			var rpm = me.rpm.getValue();
			var time_delta = getprop("sim/time/delta-realtime-sec");
			if (me.starter.getBoolValue())
			{
				rpm += time_delta * me.spool_time;
				me.rpm.setValue(rpm >= me.max_start_n1 ? me.max_start_n1 : rpm);
				me.state.setIntValue(1);
			}
			else
			{
				rpm -= time_delta * me.shutdown_time;
				me.rpm.setValue(rpm <= 0 ? 0 : rpm);
				me.running.setBoolValue(0);
				me.throttle_lever.setDoubleValue(0);
				me.started = 0;
				
				if ( rpm > 0.5 ) {
				     me.state.setIntValue(3);
					}
				
				else {
				     me.state.setIntValue(0);
					}
			}
		 
		}
		elsif (me.starter.getBoolValue())
		{
			var rpm = me.rpm.getValue();
			if ( ( rpm >= 20 ) or  ( ( rpm >= me.start_threshold )  ) )
			{
				var time_delta = getprop("sim/time/delta-realtime-sec");
				rpm += time_delta * me.spool_time;
				me.rpm.setValue(rpm);
				if (rpm >= me.n1.getValue())
				{
					me.running.setBoolValue(1);
					me.starter.setBoolValue(0);
					me.started = 1;
				}
				else
				{
					me.running.setBoolValue(0);
				}
			}
		}
		elsif (me.running.getBoolValue())
		{
			me.throttle_lever.setValue(me.idle_throttle + (1 - me.idle_throttle) * me.throttle.getValue() - me.powerloss.getValue() );
			
			me.rpm.setValue( me.n1.getValue() );
			me.state.setIntValue(2);

			
			# me.smoking.setValue( ( me.damage.getValue() * 0.2 ) + ( me.rpm.getValue() * 0.009 ) );

             if ( me.rpm.getValue() < me.overspeed_rpm ) { me.overspeed.setBoolValue(0); }	 
			 else { me.overspeed.setBoolValue(1); }
		}
	},
	fail_check: func {
		 var x = rand();
		 #print("Random Failure Generator: "~x);
		 if ( me.damage.getValue() > 0.2 ) {
		     me.stable.setBoolValue(0);
			}
		 if ( me.damage.getValue() > 0.65 ) {
		     me.serviceable.setBoolValue(0);
			}
			
		 if (( me.damage.getValue() > 0.85 ) and ( me.running.getBoolValue() )) {
		     me.explode(0.95);
			}

		
		 if ( x < me.failure_prob ) {
		     var sev = 0;
			 if ( me.failure_prob < 0.01 ) { sev = ( rand() / 5 ); }
			 else { sev = ( ( rand() + me.damage.getValue() ) / 4 ); }
		     me.fail(sev);
			 
			}
			
		 if ( me.overspeed.getBoolValue() ) {
  		     me.failure_prob += (( rand() * 0.01 ) + ( ( ( me.rpm.getValue() * me.failure_prob ) / 1000 ) ));
			}
			
		 if ( !me.stable.getBoolValue() and me.running.getBoolValue() ) {
		     # Generate and add random damage

			}
		},
	fail: func (sev = 0.2) { 
         print("Severity "~sev~" failure on "~ me.name );
		 #me.damage.setValue( me.damage.getValue() += sev);
	     var dx = ( me.damage.getValue() + sev );
		 me.damage.setValue(dx);
		 me.powerloss.setValue( dx * 4 );
		 #interpolate(me.powerloss, ( dx * 4 ), 5);				 
	    },
    explode: func (sev = 0.4) {
	     print("Explosion in " ~ me.name );
	     me.explosion.setValue(sev);
		 interpolate( me.explosion, 0, ( sev * 1.15 ) );
		 me.mpexplosion.setBoolValue(1);
		 settimer( func {
		     me.mpexplosion.setBoolValue(0);
			},2);
		 if ( rand() < 0.85 ) { me.fire.setValue( ( sev + rand() ) * 0.5 ); }
		 me.fail( sev );
		},
};

# Now do it!

   # var engine1 = Jet.new(0 , 0 , 0.01 , 5.21 , 4 , 4 , 0.05 , 1);
    #var engine2 = Jet.new(1 , 0 , 0.01 , 5.21 , 4 , 4 , 0.05 , 1);

  # engine1.init();
  # engine2.init();


props.globals.initNode("/sim/autostart/started", 0, "BOOL");

var eng1fuelon = func { setprop("/controls/engines/engine[0]/cutoff", 0); }
var eng1fueloff = func { setprop("/controls/engines/engine[0]/cutoff", 1); }

var eng2fuelon = func { setprop("/controls/engines/engine[1]/cutoff", 0); }
var eng2fueloff = func { setprop("/controls/engines/engine[1]/cutoff", 1); }

var eng1starter = func { setprop("/controls/engines/engine[0]/starter", 1); }
var eng2starter = func { setprop("/controls/engines/engine[1]/starter", 1); }

var eng1start = func {
   eng1fueloff();
   eng1starter();
   settimer(eng1fuelon, 12);
}

var eng2start = func {
   eng2fueloff();
   eng2starter();
   settimer(eng2fuelon, 12);
};

var engstart = func {
   settimer(eng1start, 2);
   settimer(eng2start, 8);
}

var engstop = func {
   eng1fueloff();
   eng2fueloff();
}

var autostart = func {
   var startstatus = getprop("/sim/autostart/started");
   if ( startstatus == 0 ) {
      gui.popupTip("Autostarting...");
	  setprop("/sim/autostart/started", 1);
      setprop("/controls/electric/battery-switch", 1);
      settimer(engstart, 0.5);
	  gui.popupTip("Starting Engines");
	  }
   if ( startstatus == 1 ) {
      gui.popupTip("Shutting Down...");
      setprop("/sim/autostart/started", 0);
	  eng1fueloff();
      eng2fueloff();
   }
}

var autostop = func {
   eng1fueloff();
   eng2fueloff();
   apufueloff();
}

print("                      ...done.");
   

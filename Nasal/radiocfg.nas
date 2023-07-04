# ARK-19 scripts support

var komp_ant = 0;
var ramka = 0;
var tlg_tlf = 0;

var ARK_channel = 0;
var ARK_channel_1 = 0;
var ARK_channel_2 = 0;
var ARK_channel_3 = 0;
var ARK_channel_4 = 0;
var ARK_channel_5 = 0;
var ARK_channel_6 = 0;
var ARK_channel_7 = 0;
var ARK_channel_8 = 0;

var COM1_channel = 0;
var COM1_channel_1 = 0;
var COM1_channel_2 = 0;
var COM1_channel_3 = 0;
var COM1_channel_4 = 0;
var COM1_channel_5 = 0;
var COM1_channel_6 = 0;
var COM1_channel_7 = 0;
var COM1_channel_8 = 0;

var RSBN_channel = 0;
var RSBN_channel_1 = 0;
var RSBN_channel_2 = 0;
var RSBN_channel_3 = 0;
var RSBN_channel_4 = 0;
var RSBN_channel_5 = 0;
var RSBN_channel_6 = 0;
var RSBN_channel_7 = 0;
var RSBN_channel_8 = 0;

var PRMG_channel = 0;
var PRMG_channel_1 = 0;
var PRMG_channel_2 = 0;
var PRMG_channel_3 = 0;
var PRMG_channel_4 = 0;
var PRMG_channel_5 = 0;
var PRMG_channel_6 = 0;
var PRMG_channel_7 = 0;
var PRMG_channel_8 = 0;


var ARK_channel_handler = func{
  var ARK_channel = getprop("/su-25/instrumentation/ARK-19/channel");
  var ARK_channel_1 = getprop("/su-25/instrumentation/ARK-19/channel-1");
  var ARK_channel_2 = getprop("/su-25/instrumentation/ARK-19/channel-2");
  var ARK_channel_3 = getprop("/su-25/instrumentation/ARK-19/channel-3");
  var ARK_channel_4 = getprop("/su-25/instrumentation/ARK-19/channel-4");
  var ARK_channel_5 = getprop("/su-25/instrumentation/ARK-19/channel-5");
  var ARK_channel_6 = getprop("/su-25/instrumentation/ARK-19/channel-6");
  var ARK_channel_7 = getprop("/su-25/instrumentation/ARK-19/channel-7");
  var ARK_channel_8 = getprop("/su-25/instrumentation/ARK-19/channel-8");
  if (ARK_channel == 1) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_1); }
  if (ARK_channel == 2) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_2); }
  if (ARK_channel == 3) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_3); }
  if (ARK_channel == 4) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_4); }
  if (ARK_channel == 5) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_5); }
  if (ARK_channel == 6) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_6); }
  if (ARK_channel == 7) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_7); }
  if (ARK_channel == 8) { setprop("/instrumentation/adf[0]/frequencies/selected-khz", ARK_channel_8); }
  if (ARK_channel == 9) { print("P :)"); }
}

var COM1_channel_handler = func{
  var COM1_channel = getprop("/su-25/instrumentation/COM1/channel");
  var COM1_channel_1 = getprop("/su-25/instrumentation/COM1/channel-1");
  var COM1_channel_2 = getprop("/su-25/instrumentation/COM1/channel-2");
  var COM1_channel_3 = getprop("/su-25/instrumentation/COM1/channel-3");
  var COM1_channel_4 = getprop("/su-25/instrumentation/COM1/channel-4");
  var COM1_channel_5 = getprop("/su-25/instrumentation/COM1/channel-5");
  var COM1_channel_6 = getprop("/su-25/instrumentation/COM1/channel-6");
  var COM1_channel_7 = getprop("/su-25/instrumentation/COM1/channel-7");
  var COM1_channel_8 = getprop("/su-25/instrumentation/COM1/channel-8");
  if (COM1_channel == 1) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_1); }
  if (COM1_channel == 2) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_2); }
  if (COM1_channel == 3) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_3); }
  if (COM1_channel == 4) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_4); }
  if (COM1_channel == 5) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_5); }
  if (COM1_channel == 6) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_6); }
  if (COM1_channel == 7) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_7); }
  if (COM1_channel == 8) { setprop("/instrumentation/comm[0]/frequencies/selected-mhz", COM1_channel_8); }
  if (COM1_channel == 9) { print("P :)"); }
}

var RSBN_channel_handler = func{
  var RSBN_channel = getprop("/su-25/instrumentation/RSBN/channel");
  var RSBN_channel_1 = getprop("/su-25/instrumentation/RSBN/channel-1");
  var RSBN_channel_2 = getprop("/su-25/instrumentation/RSBN/channel-2");
  var RSBN_channel_3 = getprop("/su-25/instrumentation/RSBN/channel-3");
  var RSBN_channel_4 = getprop("/su-25/instrumentation/RSBN/channel-4");
  var RSBN_channel_5 = getprop("/su-25/instrumentation/RSBN/channel-5");
  var RSBN_channel_6 = getprop("/su-25/instrumentation/RSBN/channel-6");
  var RSBN_channel_7 = getprop("/su-25/instrumentation/RSBN/channel-7");
  var RSBN_channel_8 = getprop("/su-25/instrumentation/RSBN/channel-8");

  if (RSBN_channel == 1) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_1); }
  if (RSBN_channel == 2) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_2); }
  if (RSBN_channel == 3) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_3); }
  if (RSBN_channel == 4) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_4); }
  if (RSBN_channel == 5) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_5); }
  if (RSBN_channel == 6) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_6); }
  if (RSBN_channel == 7) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_7); }
  if (RSBN_channel == 8) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_8); }
  if (RSBN_channel == 9) { print("P :)"); }
}

var PRMG_channel_handler = func{
  var PRMG_channel = getprop("/su-25/instrumentation/PRMG/channel");
  var PRMG_channel_1 = getprop("/su-25/instrumentation/PRMG/channel-1");
  var PRMG_channel_2 = getprop("/su-25/instrumentation/PRMG/channel-2");
  var PRMG_channel_3 = getprop("/su-25/instrumentation/PRMG/channel-3");
  var PRMG_channel_4 = getprop("/su-25/instrumentation/PRMG/channel-4");
  var PRMG_channel_5 = getprop("/su-25/instrumentation/PRMG/channel-5");
  var PRMG_channel_6 = getprop("/su-25/instrumentation/PRMG/channel-6");
  var PRMG_channel_7 = getprop("/su-25/instrumentation/PRMG/channel-7");
  var PRMG_channel_8 = getprop("/su-25/instrumentation/PRMG/channel-8");

#For storing ILS frequencies
  if (PRMG_channel == 1) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_1); }
  if (PRMG_channel == 2) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_2); }
  if (PRMG_channel == 3) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_3); }
  if (PRMG_channel == 4) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_4); }
  if (PRMG_channel == 5) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_5); }
  if (PRMG_channel == 6) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_6); }
  if (PRMG_channel == 7) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_7); }
  if (PRMG_channel == 8) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_8); }
  if (PRMG_channel == 9) { print("P :)"); }
}

var ARK_init = func{
  setprop("/su-25/instrumentation/ARK-19/channel", 1);
  setprop("/su-25/instrumentation/ARK-19/channel-1", 320); #Rostov-na-Donu
  setprop("/su-25/instrumentation/ARK-19/channel-2", 493); #Krasnodar
  setprop("/su-25/instrumentation/ARK-19/channel-3", 414); #Bassel-al Assad
  setprop("/su-25/instrumentation/ARK-19/channel-4", 395); #Shannon
  setprop("/su-25/instrumentation/ARK-19/channel-5", 316); #Dublin
  setprop("/su-25/instrumentation/ARK-19/channel-6", 390); #Aviano
  setprop("/su-25/instrumentation/ARK-19/channel-7", 356); #Praha
  setprop("/su-25/instrumentation/ARK-19/channel-8", 429); #Bratislava

  setlistener("/su-25/instrumentation/ARK-19/channel", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-1", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-2", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-3", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-4", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-5", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-6", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-7", ARK_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/ARK-19/channel-8", ARK_channel_handler,0,0 );

  setprop("/instrumentation/adf[0]/frequencies/selected-khz", 320);
}

var COM1_init = func{
  setprop("/su-25/instrumentation/COM1/channel", 1);
  setprop("/su-25/instrumentation/COM1/channel-1", 119.0); #Rostov-na-Donu
  setprop("/su-25/instrumentation/COM1/channel-2", 119.7); #Krasnodar
  setprop("/su-25/instrumentation/COM1/channel-3", 121.7); #Bassel-al Assad
  setprop("/su-25/instrumentation/COM1/channel-4", 124.0); #Shannon
  setprop("/su-25/instrumentation/COM1/channel-5", 127.1); #Dublin
  setprop("/su-25/instrumentation/COM1/channel-6", 128.2); #Aviano
  setprop("/su-25/instrumentation/COM1/channel-7", 119.0); #Praha
  setprop("/su-25/instrumentation/COM1/channel-8", 119.7); #Bratislava

  setlistener("/su-25/instrumentation/COM1/channel", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-1", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-2", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-3", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-4", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-5", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-6", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-7", COM1_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/COM1/channel-8", COM1_channel_handler,0,0 );

  setprop("/instrumentation/comm[0]/frequencies/selected-mhz", 119.0);
}

var PRMG_init = func{
  setprop("/su-25/instrumentation/PRMG/channel", 1);
  setprop("/su-25/instrumentation/PRMG/channel-1", 110.5);
  setprop("/su-25/instrumentation/PRMG/channel-2", 108.3);
  setprop("/su-25/instrumentation/PRMG/channel-3", 108.5);
  setprop("/su-25/instrumentation/PRMG/channel-4", 108.7);
  setprop("/su-25/instrumentation/PRMG/channel-5", 108.9);
  setprop("/su-25/instrumentation/PRMG/channel-6", 109.1);
  setprop("/su-25/instrumentation/PRMG/channel-7", 109.3);
  setprop("/su-25/instrumentation/PRMG/channel-8", 109.5);

  setlistener("/su-25/instrumentation/PRMG/channel", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-1", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-2", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-3", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-4", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-5", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-6", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-7", PRMG_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/PRMG/channel-8", PRMG_channel_handler,0,0 );

setprop("/instrumentation/nav[1]/frequencies/selected-mhz", 110.5);
#  screen.log.write("PRMG set", 1, 0.6, 0.1);
}

var RSBN_init = func{
  setprop("/su-25/instrumentation/RSBN/channel", 1);
#1-Rostov Na Donu-RU
  setprop("/su-25/instrumentation/RSBN/channel-1", 114.700);
#2-Krasnodar-RU
  setprop("/su-25/instrumentation/RSBN/channel-2", 115.800);
#3-Bassel Al Assad-Syria
  setprop("/su-25/instrumentation/RSBN/channel-3", 114.800);
#4-Shannon-IRL
  setprop("/su-25/instrumentation/RSBN/channel-4", 113.300);
#5-Dublin-IRL
  setprop("/su-25/instrumentation/RSBN/channel-5", 111.200);
#6-Aviano-ITA
  setprop("/su-25/instrumentation/RSBN/channel-6", 113.400);
#7-Praha-CZE
  setprop("/su-25/instrumentation/RSBN/channel-7", 112.600);
#8-Bratislava-SLO
  setprop("/su-25/instrumentation/RSBN/channel-8", 110.800);

  setlistener("/su-25/instrumentation/RSBN/channel", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-1", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-2", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-3", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-4", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-5", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-6", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-7", RSBN_channel_handler,0,0 );
  setlistener("/su-25/instrumentation/RSBN/channel-8", RSBN_channel_handler,0,0 );

  setprop("/instrumentation/nav/frequencies/selected-mhz", 114.700);
#  screen.log.write("RSBN set", 1, 0.6, 0.1);
}

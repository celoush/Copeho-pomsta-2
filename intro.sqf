titlecut ["","BLACK IN",999999999999999];
nepratele = [i_1,i_2,i_3,i_4,i_5,i_6];
bomba_boom = false;
cope disableConversation true;
cope2 disableConversation true;
player disableConversation true;
cope setVariable ["BIS_noCoreConversations", true];
cope2 setVariable ["BIS_noCoreConversations", true];
player setVariable ["BIS_noCoreConversations", true];

CELO_vybaveni_hajzl = {
  #include "sqf\hajzl_equipment.sqf";
};

CELO_loko_move = {
  _kroku = 1000;
  _prodleva = 0.015;
  _loko = _this select 0;
  _sta_x = (getpos (_this select 1)) select 0;
  _sta_y = (getpos (_this select 1)) select 1;
  _cil_x = (getpos (_this select 2)) select 0;
  _cil_y = (getpos (_this select 2)) select 1;
  
  _rozdil_x = _cil_x - _sta_x;
  _koef_x   = _rozdil_x/_kroku;
  _rozdil_y = _cil_y - _sta_y;
  _koef_y   = _rozdil_y/_kroku;
  for "_i" from 1 to _kroku do {    
    _loko setpos [_sta_x+_i*_koef_x,_sta_y+_i*_koef_y,0.05];
    sleep _prodleva;
  };
};

CELO_intro_kamera = {
  0 spawn {
    waitUntil {preloadCamera getpos i_1};
  }; 
  //"colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [1, 0.7, 0.4, 0.4],  [0.199, 0.587, 0.114, 0.0]];
  "colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [0.5, 0.5, 0.3, 0.25],  [0.199, 0.587, 0.114, 0.0]];
  "colorCorrections" ppEffectCommit 0;  
  "colorCorrections" ppEffectEnable true;

  0 fadesound 0;
  0 fademusic 1;
  playmusic "CELO_Cope_intro";  
  _camera = "camera" camCreate [0,0,0];
  _camera camPrepareTarget [0,0,1];
  _camera cameraEffect ["internal", "BACK"];
  _camera camCommitPrepared 0;
  sleep 5;
  titleRsc ["CELO_titlesceloush", "PLAIN"];
  sleep 5;
  titleRsc ["CELO_titlesuvadi", "PLAIN"];
  sleep 4.3;
  _camera camPrepareTarget [44817.63,89067.89,-52841.54];
  _camera camPreparePos [13022.88,10258.80,0.62];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",3];
  sleep 5;
  _camera camPrepareTarget [50419.25,102952.55,-3184.77];
  _camera camPreparePos [13022.88,10258.80,0.62];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 6;
  waitUntil {camCommitted _camera};
  sleep 2;
  _camera camPrepareTarget [69763.99,92511.63,-3126.72];
  _camera camPreparePos [13007.04,10235.43,1.82];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 15;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK OUT",2];
  sleep 2;
  i_2 setmimic "angry";
  titlecut ["","BLACK IN",2];
  // konec prujezdu
  // nahled na sefika
  _camera camPrepareTarget [90923.23,72881.39,1469.67];
  _camera camPreparePos [12995.48,10230.82,1.37];
  _camera camPrepareFOV 0.016;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  sleep 4;
  // nahled na drsnaky
  _camera camPrepareTarget [67599.22,94025.91,-896.55];
  _camera camPreparePos [13009.36,10244.76,1.65];
  _camera camPrepareFOV 0.114;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  sleep 4;
  titlecut ["","BLACK OUT",2];
  sleep 2;
  // prujezd ze zlejch   
  _camera camPrepareTarget [71642.20,91256.35,-942.29];
  _camera camPreparePos [13023.98,10242.54,1.34];
  _camera camPrepareFOV 0.439;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",2];
  // na nadrazi
  _camera camPrepareTarget [-85207.31,27348.06,7342.67];
  _camera camPreparePos [13026.94,10239.59,1.42];
  _camera camPrepareFOV 0.439;
  _camera camCommitPrepared 12;
  waitUntil {camCommitted _camera};
  sleep 2;
  // a na koleje
  _camera camPrepareTarget [-20870.76,-83713.26,4320.05];
  _camera camPreparePos [13026.47,10269.04,0.80];
  _camera camPrepareFOV 0.439;
  _camera camCommitPrepared 10;
  sleep 6;
  // pustim vlak a pak ho odprasknu a ukazu titulek
  0 spawn {
    [lokomotiva,loko_start,loko_cil] call CELO_loko_move;
    bomba_boom = true;
    // lokoska dojela.... bude booom
    0 fadesound 1;  
    _bomb = "Bo_GBU12_LGB" createVehicle getPos lokomotiva;
    _bomb setdammage 1; // asi neni nutne
    sleep 3;
    cope setpos getpos loko_start;      
    cope2 setpos getpos cope2_position;
    cope2 setbehaviour "CARELESS";
    5 fadesound 0;    
    sleep 1;
    cope2 setunitpos "UP";
    
  };
  waitUntil {camCommitted _camera};
  _camera camPrepareFOV 0.409;
  _camera camCommitPrepared 7;
  sleep 5;
  titlecut ["","BLACK OUT",2];
  sleep 2.2;
  // odjezd od zlejch
  _camera camPrepareTarget [22451.79,109644.24,-5385.76];
  _camera camPreparePos [13013.75,10225.96,2.19];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};  
  titlecut ["","BLACK IN",2];
  // na prejezd a cekani na bum
  
  _camera camPrepareTarget [20469.41,109771.91,-526.62];
  _camera camPreparePos [12955.23,10055.18,2.19];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 28;
  waitUntil {camCommitted _camera};
  waitUntil {bomba_boom};

  _camera camPrepareTarget [getpos cope select 0,getpos cope select 1,1.8];
  _camera camPreparePos [12954.23,10054.18,1.19];
  _camera camPrepareFOV 0.400;
  _camera camCommitPrepared 10;
  sleep 1;  
  _group = group cope2;
  _group addWaypoint [getpos cope, 0];
  [_group, 1] setWaypointType "MOVE";
  [_group, 1] setWaypointSpeed "LIMITED";
  [_group, 1] setWaypointBehaviour "CARELESS";
  [_group, 1] setWaypointCombatMode "BLUE";
  [_group, 1] setWaypointStatements ["konec_intra",""];   
  sleep 1;   
  cope2 domove [(getpos cope select 0)-2,(getpos cope select 1) - 2,0];
  
  titlecut ["","BLACK OUT",8];
  sleep 2;
  titleRsc ["CELO_titlesorb", "PLAIN"];
  sleep 2;
  12 fademusic 0;
  sleep 14; 
  konec_intra=true;
};

0 spawn {
  {_x call CELO_vybaveni_hajzl} foreach nepratele;
  call CELO_intro_kamera;
  0 spawn {   
    // nastaveni dvojnika - premisti se az potom
    cope setbehaviour "COMBAT";
    sleep 1;
    cope setunitpos "UP";
    cope disableAI "MOVE";
    cope disableAI "AUTOTARGET";
    cope disableAI "ANIM";
    sleep 2;
    cope stop true;
    cope setdir getdir cope_position;
    
  };



};


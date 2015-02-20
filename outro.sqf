titlecut ["","BLACK IN",999999999999999];
0 spawn {
  waitUntil {preloadCamera getpos heli};
};
0 spawn {
  waitUntil {preloadCamera getpos cope};
};
konec_outro = false;
cope_go=false;
cope_go2=false;
enemies = [e1];
for "_i" from 1 to 20 do {
  call compile format["enemies = enemies + [e1_%1];",_i]; 
};
_herci = enemies + [cope,cope2];
{_x setcaptive true; _x disableAI "target"; _x disableAI "autotarget";_x setunitpos "UP";} foreach _herci;
_null = [] spawn {
  cope execVM "sqf\cope_equipment_intro.sqf";
  cope2 execVM "sqf\cope_equipment_intro2.sqf";
};

sleep 3:
titlecut ["","BLACK IN",3];

"colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [0.5, 0.5, 0.3, 0.25],  [0.199, 0.587, 0.114, 0.0]];
"colorCorrections" ppEffectCommit 0;  
"colorCorrections" ppEffectEnable true;

0 fadesound 0;
0 fademusic 1;
playmusic "CELO_Cope_outro";

_camera = "camera" camCreate [0,0,0];
_camera camPrepareTarget [0,0,1];
_camera cameraEffect ["internal", "BACK"];
_camera camCommitPrepared 0;

_camera camPrepareTarget [-73224.00,-11275.12,-58679.02];
_camera camPreparePos [4824.91,9965.52,8.13];
_camera camPrepareFOV 0.469;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};
sleep 1;
1 fadesound 1;
sleep 1;
heli domove [0,0,100];
sleep 2;

_camera camPrepareTarget [-80438.81,-21674.24,-41313.04];
_camera camPreparePos [4843.15,9973.70,11.75];
_camera camPrepareFOV 0.469;
_camera camCommitPrepared 5;
waitUntil {camCommitted _camera};

_camera camPrepareTarget [-90084.13,38014.34,14304.89];
_camera camPreparePos [4824.58,9963.22,3.65];
_camera camPrepareFOV 0.469;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};

_camera camPrepareTarget [-90084.13,38014.34,14304.89];
_camera camPreparePos [4829.39,9961.99,1.02];
_camera camPrepareFOV 0.469;
_camera camCommitPrepared 5;
sleep 3;
{_x domove getpos heli} foreach enemies;
waitUntil {camCommitted _camera};


_camera camPrepareTarget [-90998.07,-18216.24,-949.81];
_camera camPreparePos [4932.22,10000.21,0.77];
_camera camPrepareFOV 0.554;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};

_camera camPrepareTarget [-90998.07,-18216.24,-949.81];
_camera camPreparePos [4931.25,10003.51,6.24];
_camera camPrepareFOV 0.554;
_camera camCommitPrepared 8;
sleep 5;
_bomb = "Bo_GBU12_LGB" createVehicle getPos heli;
_bomb setdammage 1; // asi neni nutne
sleep 1.5;

{_x domove getpos _x} foreach enemies;
{_x stop true;_x disableAI "move";sleep 0.05} foreach enemies;

waitUntil {camCommitted _camera};

sleep 2.5;
titlecut ["","BLACK OUT",2];
// pohle na copa
sleep 2;
cope_go=true;
sleep 1;

_camera camPrepareTarget [-14528.55,-88040.54,340.61];
_camera camPreparePos [4983.60,10036.81,1.09];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
titlecut ["","BLACK IN",1.5];
waitUntil {camCommitted _camera};

// jak jde
_camera camPrepareTarget [-46271.22,-74773.90,13739.16];
_camera camPreparePos [4979.17,10042.65,1.06];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 6;
sleep 5;
cope_go2=true;
waitUntil {camCommitted _camera};

// pohle na copa2
_camera camPrepareTarget [-68902.65,77422.84,-28.81];
_camera camPreparePos [4975.00,10050.18,1.18];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};

//jak jde
_camera camPrepareTarget [-84913.02,-33762.62,262.52];
_camera camPreparePos [4981.43,10043.63,1.15];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 6.5;
waitUntil {camCommitted _camera};

sleep 0.5;

// na ne
_camera camPrepareTarget [-84913.02,-33762.62,262.52];
_camera camPreparePos [4981.43,10043.63,8.02];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 3;
sleep 2;
titlecut ["","BLACK OUT",1];
waitUntil {camCommitted _camera};

// pohled z copu 
_camera camPrepareTarget [95777.10,49732.45,13745.56];
_camera camPreparePos [4975.94,10040.71,1.23];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};
titlecut ["","BLACK IN",1];

sleep 0.8;

cope enableAI "target";
cope2 enableAI "target";
cope2 enableAI "autotarget";
cope enableAI "autotarget";
cope dowatch getpos e1_1;
cope2 dowatch getpos e1_1;
cope dotarget e1_1;
cope2 dotarget e1_2;
cope reveal e1_1;
cope2 reveal e1_2;

sleep 2;

//na nepritele
_camera camPrepareTarget [96522.62,50058.41,32.80];
//_camera camPrepareTarget [getpos heli select 0,getpos heli select 1,22.80];
//_camera camPreparePos [4894.79,9995.46,5.39];
_camera camPreparePos [getpos heli select 0,getpos heli select 1,5.39];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 4;
sleep 2;

{_x enableAI "target";_x enableAI "autotarget";_x enableAI "move";_x dowatch getpos cope2;cope reveal _x;cope2 reveal _x} foreach enemies;
cope setbehaviour "COMBAT";
cope setcombatmode "RED"; 
cope2 setbehaviour "COMBAT";
cope2 setcombatmode "RED";
cope disableai "move";
cope2 disableai "move"; 

sleep 1;
titlecut ["","BLACK OUT",1];
waitUntil {camCommitted _camera};

e1_1 setpos getpos xxx;
e1_2 setpos getpos xxx;
cope reveal e1_1;
cope2 reveal e1_2;

// konec
_camera camPrepareTarget [99194.12,40661.91,13954.12];
_camera camPreparePos [4973.90,10040.55,1.01];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};
titlecut ["","BLACK IN",1];
{_x setcaptive false} foreach enemies;
sleep 1;
cope dofire e1_1;
cope2 dofire e1_2;
sleep 4;

_camera camPrepareTarget [99194.12,40661.91,13954.28];
_camera camPreparePos [4973.90,10040.55,31.31];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
sleep 3;

[] spawn {
  while {true} do {
    cope2 fire "RPK_74";
    sleep 0.5;
    cope fire "M1014";
    sleep 0.5;
  };
};

titlecut ["","BLACK OUT",10];
titleRsc ["CELO_titleskonec", "PLAIN"];
sleep 8;
titleRsc ["CELO_titlespokracovani", "PLAIN"];
7 fademusic 0;
7 fadesound 0;
sleep 10;
konec_outro = true;
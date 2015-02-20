enableEnvironment false;
// -------------------------- VLOZIM FUNKCE ------------------------------------
#include "sqf\funkce.sqf";
cope disableConversation true;
cope2 disableConversation true;
player disableConversation true;

FAZE = "misto1"; // nabyva hodnot misto1...mistox podle toho, co zrovna hraju
DEBUG = false;

cope setIdentity "CELO_Cope";
cope2 setIdentity "CELO_Cope2";
#include "sqf\player_equipment.sqf";

0 fadesound 0;
0 fademusic 0;

list_misto1_hlidaci = [];
list_misto1_patraci = [];
{call compile format ["if (!isNil(""m1_v%1"")) then {list_misto1_hlidaci = list_misto1_hlidaci + [m1_v%1];};",_x];} foreach [1,2,3,4,5];
{call compile format ["if (!isNil(""m1_v%1"")) then {list_misto1_patraci = list_misto1_patraci + [m1_v%1];};",_x];} foreach [6,7,8,9,10,11,12];
list_misto1 = list_misto1_hlidaci + list_misto1_patraci;  

list_misto2_hlidaci = [];
list_misto2_patraci = [];
{call compile format ["if (!isNil(""m2_v%1"")) then {list_misto2_hlidaci = list_misto2_hlidaci + [m2_v%1];};",_x];} foreach [1,2,3,4,5,16,17,18,19,20,21,22,23,24,25];
{call compile format ["if (!isNil(""m2_v%1"")) then {list_misto2_patraci = list_misto2_patraci + [m2_v%1];};",_x];} foreach [6,7,8,9,10,11,12,14];
list_misto2 = list_misto2_hlidaci + list_misto2_patraci;  


list_misto3_hlidaci = [];
list_misto3_patraci = [];
{call compile format ["if (!isNil(""m3_v%1"")) then {list_misto3_hlidaci = list_misto3_hlidaci + [m3_v%1];};",_x];} foreach [1,2,3,4,5,6,7,8,9,10];
{call compile format ["if (!isNil(""m3_v%1"")) then {list_misto3_patraci = list_misto3_patraci + [m3_v%1];};",_x];} foreach [11,12,13,14,15,16,17,18];
list_misto3 = list_misto3_hlidaci + list_misto3_patraci;  


list_misto4_hlidaci = [];
list_misto4_patraci = [];
{call compile format ["if (!isNil(""m4_v%1"")) then {list_misto4_hlidaci = list_misto4_hlidaci + [m4_v%1];};",_x];} foreach [1,2,3,4,5,6];
{call compile format ["if (!isNil(""m4_v%1"")) then {list_misto4_patraci = list_misto4_patraci + [m4_v%1];};",_x];} foreach [7,8,9,10,11,12,13,14,15];
list_misto4 = list_misto4_hlidaci + list_misto4_patraci;  

list_misto5 = [m5_v1,m5_v2,m5_v3,m5_v4];  

list_misto6_hlidaci = [];
list_misto6_patraci = [];
{call compile format ["if (!isNil(""m6_v%1"")) then {list_misto6_hlidaci = list_misto6_hlidaci + [m6_v%1];};",_x];} foreach [1,2,3,4,5,6,7,8,9,10];
{call compile format ["if (!isNil(""m6_v%1"")) then {list_misto6_patraci = list_misto6_patraci + [m6_v%1];};",_x];} foreach [11,12,13,14,15,16,17,18];
list_misto6 = list_misto6_hlidaci + list_misto6_patraci;  


titlecut ["","BLACK IN",999999999999999];
// -------------------------- HLAVNI CAST --------------------------------------

[] spawn {
  // hlavni skript
  VYSTRELU=0;
  call CELO_zacatek_faze;
  
  cope addEventHandler["fired",{
    0 spawn { 
      call compile format["%1_poplach = true", FAZE];
      call CELO_skript_max;
    };
  }];

  cope2 addEventHandler["fired",{
    0 spawn {
      call compile format["%1_poplach = true", FAZE];
      call CELO_skript_max2;
    };
  }];
  
  waitUntil {konec_misto1};
  setacctime 1;
  sleep 3;
  titlecut ["","BLACK OUT",2];
  sleep 2;
  FAZE = "misto2";  
  call CELO_zacatek_faze;

  sleep 2;

  waitUntil {konec_misto2};
  setacctime 1;
  sleep 3;
  titlecut ["","BLACK OUT",2];
  sleep 2;
  FAZE = "misto3";  
  call CELO_zacatek_faze;

  sleep 2;
  
  waitUntil {konec_misto3};
  setacctime 1;
  sleep 3;
  titlecut ["","BLACK OUT",2];
  sleep 2;
  FAZE = "misto4";  
  call CELO_zacatek_faze;

  sleep 2;

  waitUntil {konec_misto4};
  setacctime 1;
  sleep 3;
  titlecut ["","BLACK OUT",2];
  sleep 2;
  FAZE = "misto5";  
  call CELO_zacatek_faze;

  sleep 2;

  waitUntil {konec_misto5};
  setacctime 1;
  sleep 3;
  titlecut ["","BLACK OUT",2];
  sleep 2;
  FAZE = "misto6";  
  call CELO_zacatek_faze;

  waitUntil {konec_misto6};
  
  activateKey "klic_celo_2":
  
  setacctime 1;
  sleep 3;
  titlecut ["","BLACK OUT",2];
  
};

if (DEBUG) then {

  _radio = createTrigger ["EmptyDetector", [0,0,0]];
  _radio setTriggerArea [0, 0, 0, true];
  _radio setTriggerActivation ["GOLF", "PRESENT", true];
  _radio setTriggerText "Destroy all actual enemies";
  _radio setTriggerStatements ["this", "_null = call compile format[""{_x setdammage 1} foreach list_%1"", FAZE]", ""];

};
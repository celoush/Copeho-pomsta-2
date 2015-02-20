CELO_vybaveni_hajzl = {
  #include "hajzl_equipment.sqf";
};

CELO_vybaveni_hajzl_dve = {
  #include "hajzl_equipment2.sqf";
};

CELO_vybaveni_hrac = {
  #include "player_equipment.sqf";
};

CELO_vybaveni_hrac_dve = {
  #include "player_equipment2.sqf";
};

CELO_Nastav_Postavu_Jedna = {
  if (!alive cope) then {error_end=true};
  addSwitchableUnit cope;
  selectPlayer cope;
  removeSwitchableUnit cope2;  
};

CELO_Nastav_Postavu_Dve = {
if (!alive cope2) then {error_end=true};
  addSwitchableUnit cope2;
  selectPlayer cope2;
  removeSwitchableUnit cope;    
};

CELO_skript_max = {
  FIRED=true; // na tohle reaguji nektere skripty a vraceji to do false
  _cekej = 2.5 + random 0.5;
  VYSTRELU=VYSTRELU+1;
  if (VYSTRELU>=1) then {
    "radialBlur" ppEffectAdjust [0.02,0.02,0.15 - VYSTRELU/50,0.15 - VYSTRELU/50];
    "radialBlur" ppEffectEnable true;
    "radialBlur" ppEffectCommit 0;
  };
  setacctime 0.3 + random 0.1;
  sleep _cekej;
  VYSTRELU=VYSTRELU-1;
  if (VYSTRELU<=0) then { // pokud ne, pak vystrelil jeste jednou a o zrychleni se postara jiny skript
    "radialBlur" ppEffectAdjust [0,0,0,0];
    "radialBlur" ppEffectEnable true;
    "radialBlur" ppEffectCommit 0.9;
    setAccTime 0.4;
    sleep 0.2;
    setAccTime 0.6;
    sleep 0.3;
    setAccTime 0.8;
    sleep 0.4;
    setAccTime 1;  
    "radialBlur" ppEffectEnable false;
    "radialBlur" ppEffectCommit 0;
    VYSTRELU=0;
  };
  if (DEBUG) then {hintSilent format["%1",VYSTRELU];};
};

CELO_skript_max2 = { // mladej to nema tak lehke, ale ma kulomet :)
  FIRED=true; // na tohle reaguji nektere skripty a vraceji to do false
  _cekej = 1 + random 1;
  VYSTRELU=VYSTRELU+1;
  if (VYSTRELU>=1) then {
    "radialBlur" ppEffectAdjust [0.07+VYSTRELU/100,0.07+VYSTRELU/100,0.35 - VYSTRELU/70,0.35 - VYSTRELU/70];
    "radialBlur" ppEffectEnable true;
    "radialBlur" ppEffectCommit 0;
  };
  setacctime 0.7 + random 0.15;
  
  sleep _cekej;
  
  VYSTRELU=VYSTRELU-1;
  if (VYSTRELU<=0) then { // pokud ne, pak vystrelil jeste jednou a o zrychleni se postara jiny skript
    "radialBlur" ppEffectAdjust [0,0,0,0];
    "radialBlur" ppEffectEnable true;
    "radialBlur" ppEffectCommit 0.9;
    setAccTime 1;
    sleep 0.9;      
    "radialBlur" ppEffectEnable false;
    "radialBlur" ppEffectCommit 0;
    VYSTRELU=0;
  };
  if (DEBUG) then {hintSilent format["%1",VYSTRELU];};
};


CELO_zacatek_faze = {
  player call CELO_vybaveni_hrac;
  /*
  if (FAZE=="misto1") then {
    0 spawn { // chovani krav :)
      _krav = 5 + ceil random 8; 
      _grp = createGroup EAST;
      for "_i" from 1 to _krav do {
        _typ = 0 + ceil random 3;
        call compile format ["_unit%2 = _grp createUnit [""Cow0%1"", position kravaPozice, [], 25, ""NONE""];",_typ,_i];
      };
      waitUntil {FIRED or konec_misto1};
      for "_i" from 1 to _krav do { 
        call compile format ["_unit%1 domove getpos kravaCil;",_i];
        //call compile format ["_unit%1 execFSM ""fsm\krava.fsm"";",_i];
        sleep 0.2+random 0.1;
      };
    };
  };
  */
  
  
  if (FAZE=="misto3" OR FAZE=="misto5") then {
    player call CELO_Nastav_Postavu_Jedna;
  } else {
    if (FAZE=="misto2" OR FAZE=="misto4" OR FAZE=="misto6") then {
      player call CELO_Nastav_Postavu_Dve;
      player call CELO_vybaveni_hrac_dve;
    };
  };
  player setdammage 0;
  skiptime 0.5;
  call compile format["player setpos getpos %1_start", FAZE];
  call compile format["player setdir getdir %1_start", FAZE];
  call compile format["konec_%1 = false", FAZE];
  call compile format["%1_poplach = false", FAZE];
   if (FAZE=="misto2" OR FAZE=="misto4" OR FAZE=="misto6") then {
    call compile format["{_x call CELO_vybaveni_hajzl_dve} foreach list_%1;",FAZE];
   } else {
    call compile format["{_x call CELO_vybaveni_hajzl} foreach list_%1;",FAZE];
  };
  call compile format["{_x addEventHandler [""fired"",{%1_poplach=true}]} foreach list_%1;",FAZE];
  call compile format["{_x setSkill [""aimingAccuracy"",0.15+random 0.25];_x setSkill [""courage"",0.6+random 0.2];_x setSkill [""spotDistance"",0.5+random 0.2];_x setSkill [""spotTime"",0.6+random 0.2];_x setSkill [""aimingShake"",0.15+random 0.25];_x setSkill [""aimingSpeed"",0.15+random 0.25];} foreach list_%1;",FAZE];
  call compile format["{_x spawn {waitUntil {(_this knowsAbout player)>(0.1+random 0.1)};sleep 2;if (alive _this) then {%1_poplach = true};sleep 8;if (alive _this) then {{_x reveal player} foreach  list_%1;};};} foreach list_%1",FAZE];
  call compile format["_null = 0 execVM ""sqf\kamera_%1.sqf"";", FAZE]; 
  VYSTRELU=0;
};
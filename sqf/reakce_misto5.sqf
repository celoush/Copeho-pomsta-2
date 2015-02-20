_group = creategroup EAST;
konec_misto5 = false;

crew m5_v1 joinSilent _group;
crew m5_v2 joinSilent _group;
crew m5_v3 joinSilent _group;
crew m5_v4 joinSilent _group;

_group addWaypoint [getpos vehicle cope, 5];
[_group, 1] setWaypointType "SAD";
[_group, 1] setWaypointSpeed "FULL";
[_group, 1] setWaypointBehaviour "AWARE";
[_group, 1] setWaypointFormation "COLUMN"; 
[_group, 1] setWaypointCombatMode "RED";
[_group, 1] setWaypointStatements ["konec_misto5",""]; 

_group allowFleeing 0;

// skript pro chovani ridicu
{
  _x spawn {
    waitUntil {vehicle _this distance cope<5 or _this knowsabout cope>0.1 or !alive _this};
    if (alive _this) then {
      vehicle _this setfuel 0;
      waitUntil {speed vehicle _this<(5+random 5)}; 
      _this action ["EJECT",vehicle _this];
      unassignVehicle _this;
      _this reveal cope;
      _this doTarget cope;
      _this doFire cope;
    };
  };
} foreach units _group;

[_group, 1] setWaypointBehaviour "COMBAT";

while {!konec_misto5} do {
  // pri kazdem vystrelu (max. 1x do sekundy) hrace presmeruju WP na hrace
  waitUntil {FIRED or konec_misto5};
  [_group, 1] setWaypointPosition [position vehicle cope,5];
  _group setCurrentWaypoint [_group,1];
  _group reveal cope; 
  FIRED = false;
  sleep 5;
};

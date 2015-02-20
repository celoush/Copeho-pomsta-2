_group = creategroup EAST;
konec_misto2 = false;

list_misto2_patraci joinSilent _group;

_group addWaypoint [getpos player, 5];
[_group, 1] setWaypointType "SAD";
[_group, 1] setWaypointSpeed "LIMITED";
[_group, 1] setWaypointBehaviour "COMBAT";
[_group, 1] setWaypointCombatMode "RED";
[_group, 1] setWaypointStatements ["konec_misto2",""]; 

{
  (group _x) addWaypoint [getPos _x,0];
  [group _x, 1] setWaypointType "HOLD"; 
  _x setCombatMode "RED"; 
  _x setBehaviour "COMBAT"
} foreach list_misto2_hlidaci;
sleep 1;

{group _x allowFleeing 0;_x setUnitPos "Middle"} foreach list_misto2;

// po nejakem case pridam k patracum i hlidace

sleep (55 + random 65); // simuluje situaci, kdy zjisti, ze si sam a poslou na tebe vsechny :)

list_misto2_hlidaci joinSilent _group;

while {!konec_misto2} do {
  // pri kazdem vystrelu (max. 1x do sekundy) hrace presmeruju WP na hrace
  waitUntil {FIRED or konec_misto2};
  [_group, 1] setWaypointPosition [position player,5];
  _group setCurrentWaypoint [_group,1];
  FIRED = false;
  sleep 1;
};


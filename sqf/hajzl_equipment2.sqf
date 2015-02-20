  removeAllWeapons _this; 
  _this addMagazine "30Rnd_762x39_AK47"; 
  _this addWeapon "AK_47_M";
  _this setSkill ["aimingShake",0.25];
  _this setSkill ["aimingAccuracy",0.25];
  _this setSkill ["aimingSpeed",0.75];
  for "_i" from 1 to 5 do {
    _this addMagazine "30Rnd_762x39_AK47";
  };
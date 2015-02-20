
0 spawn {
  0 fadesound 0;  
  0 fademusic 1;
  
  _null = 0 execVM "sqf\akce_misto5.sqf";
  
  0 spawn {
    waitUntil {preloadCamera getpos vehicle m5_v1};
  };  

  0 spawn {
    waitUntil {preloadCamera getpos misto5_start};
  };  
  
  titlecut ["","BLACK IN",1];
  playmusic "CELO_Cope_5";  
  _camera = "camera" camCreate [0,0,0];
  _camera camPrepareTarget [0,0,1];
  _camera cameraEffect ["internal", "BACK"];
  _camera camCommitPrepared 0;


  [] spawn {
    // obrazove a zvukove efekty na zacatku
    
    //"colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [1, 0.7, 0.4, 0.4],  [0.199, 0.587, 0.114, 0.0]]; 
    //"colorCorrections" ppEffectAdjust [0.95, 0.95, 0, [0.0, 0.0, 0.0, 0.0], [1.0,1, 1, 0], [0.199, 0.587, 0.114, 0.0]]; -- CB
    //"colorCorrections" ppEffectAdjust [0.95, 0.95, 0, [0.0, 0.0, 0.0, 0], [1,0,0.5,0.5], [0.1, 0.1, 0.5, 0.2]];
    //"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.5], [0.25, 0.27, 0.27, 0.8]];
    "colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [1, 0.7, 0.4, 0.25],  [0.199, 0.587, 0.114, 0.0]]; 
    "colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [0.5, 0.5, 0.3, 0.25],  [0.199, 0.587, 0.114, 0.0]]; 
    "colorCorrections" ppEffectCommit 0;  
    "colorCorrections" ppEffectEnable true;    
     
    "dynamicBlur" ppEffectEnable true;   
    "dynamicBlur" ppEffectAdjust [6];   
    "dynamicBlur" ppEffectCommit 0;     
    "dynamicBlur" ppEffectAdjust [0.0];  
    "dynamicBlur" ppEffectCommit 4;  
  
  };

  _camera camPrepareTarget [28643.36,106422.18,61.81];
  _camera camPreparePos [5697.23,9090.41,0.20];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  
  waitUntil {camCommitted _camera};
  
  sleep 5;
  
  _camera camPrepareTarget [43968.21,101477.13,216.16];
  _camera camPreparePos [5691.82,9092.51,3.01];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 5;
  
  waitUntil {camCommitted _camera};
  0 fadesound 1;
  
  sleep 2;
  titlecut ["","BLACK OUT",1];
  sleep 1;

  _camera camPrepareTarget [-11022.95,-88212.34,11644.13];
  _camera camPreparePos [5760.92,9713.45,1.14];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};

  titlecut ["","BLACK IN",1];
 
  sleep 1;

  _camera camPrepareTarget [-11056.96,-88407.69,-9145.50];
  _camera camPreparePos [5733.92,9718.08,37.23];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 10;
  sleep 9;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
 
  _camera camPrepareFocus [-1,1];
  _camera CameraEffect ["Terminate", "Back"];
  CamDestroy _camera;

  titlecut ["","BLACK IN",2];

  sleep 2;

  player setcaptive false;
  0 fadesound 1;  
  savegame;
  

  
  
  
};


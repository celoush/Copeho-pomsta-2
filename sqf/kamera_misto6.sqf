
0 spawn {
  0 fadesound 0;  
  0 fademusic 1;
   
  0 spawn {
    waitUntil {preloadCamera getpos misto6_start};
  };  
  
  titlecut ["","BLACK IN",1];
  playmusic "CELO_Cope_6";
    
  _camera = "camera" camCreate [0,0,0];
  _camera camPrepareTarget [0,0,1];
  _camera cameraEffect ["internal", "BACK"];
  _camera camCommitPrepared 0;


  [] spawn {
    // obrazove a zvukove efekty na zacatku
    
    //"colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [0.5, 0.5, 0.3, 0.25],  [0.199, 0.587, 0.114, 0.0]];
    "colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [1, 0.7, 0.4, 0.25],  [0.199, 0.587, 0.114, 0.0]]; 
    "colorCorrections" ppEffectCommit 0;  
    "colorCorrections" ppEffectEnable true;    
     
    "dynamicBlur" ppEffectEnable true;   
    "dynamicBlur" ppEffectAdjust [6];   
    "dynamicBlur" ppEffectCommit 0;     
    "dynamicBlur" ppEffectAdjust [0.0];  
    "dynamicBlur" ppEffectCommit 4;  
  
  };

  _camera camPrepareTarget [-55734.14,-69654.13,9727.75];
  _camera camPreparePos [5602.42,8780.63,3.64];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  
  waitUntil {camCommitted _camera};
  
  
  _camera camPrepareTarget [-23115.44,-87024.63,-2865.83];
  _camera camPreparePos [5529.86,8731.60,3.22];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 8;
  
  sleep 7;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};  
  
  
  _camera camPrepareTarget [89198.16,61136.27,-15243.00];
  _camera camPreparePos [5510.97,8637.29,2.91];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};

  titlecut ["","BLACK IN",1];
 
  _camera camPrepareTarget [99442.57,11747.13,-33780.79];
  _camera camPreparePos [5491.86,8665.21,9.82];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 9;
  sleep 8;
  
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
 
  _camera camPrepareTarget [-68849.66,75057.77,-5532.40];
  _camera camPreparePos [5636.77,8561.21,17.53];
  _camera camPrepareFOV 0.322;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};

  titlecut ["","BLACK IN",1];
 
  _camera camPrepareTarget [-70730.57,73107.43,1149.78];
  _camera camPreparePos [5654.06,8578.56,1.51];
  _camera camPrepareFOV 0.322;
  _camera camCommitPrepared 12;
  sleep 11;
  
  titlecut ["","BLACK OUT",1];
  sleep 1;
  _camera camPrepareFocus [-1,1];
  _camera CameraEffect ["Terminate", "Back"];
  CamDestroy _camera;

  titlecut ["","BLACK IN",2];

  sleep 2;

  player setcaptive false;
  0 fadesound 1;  
  savegame;
  

  
  
  
};
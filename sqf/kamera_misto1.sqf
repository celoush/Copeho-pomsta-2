0 spawn {

  0 spawn {
    waitUntil {preloadCamera getpos m1_v1};
  };
    
  sleep 3;
  player call CELO_vybaveni_hrac; // pojistka
 
  playmusic "CELO_Cope_1";  
  _camera = "camera" camCreate [0,0,0];
  _camera camPrepareTarget [0,0,1];
  _camera cameraEffect ["internal", "BACK"];
  _camera camCommitPrepared 0;

  titlecut ["","BLACK IN",1];
  5 fadesound 1;
  5 fademusic 1;  

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

      
  _camera camPrepareTarget [-75372.16,64594.40,-4678.37];
  _camera camPreparePos [9806.53,12401.49,2.90];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};

  sleep 3;
  
  _camera camPrepareTarget [89244.23,72975.09,-4295.18];
  _camera camPreparePos [9806.53,12401.49,2.90];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 10;
  sleep 9;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [-33434.76,-74318.88,24527.04];
  _camera camPreparePos [9892.25,12471.68,0.20];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [-19404.58,-82262.73,-12690.06];
  _camera camPreparePos [9892.03,12471.75,2.70];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 10;
  sleep 9;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [-19786.86,-82958.42,-3362.99];
  _camera camPreparePos [9909.05,12474.01,2.39];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [-88599.13,-2199.58,-9099.80];
  _camera camPreparePos [9905.12,12448.24,1.65];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 10;
  waitUntil {camCommitted _camera};
  sleep 2;
  titlecut ["","BLACK OUT",1];
  
  _camera camPrepareFocus [-1,1];
  _camera CameraEffect ["Terminate", "Back"];
  CamDestroy _camera;

  titlecut ["","BLACK IN",2];

  sleep 2;
  
  saveGame;
  0 fadesound 1;


};

0 spawn {

  0 spawn {
    waitUntil {preloadCamera getpos m4_v1};
  };

  //"colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [0.5, 0.5, 0.3, 0.25],  [0.199, 0.587, 0.114, 0.0]];
  "colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [1, 0.7, 0.4, 0.25],  [0.199, 0.587, 0.114, 0.0]]; 
  "colorCorrections" ppEffectCommit 0;  
  "colorCorrections" ppEffectEnable true;
  0 fadesound 0;
  0 fademusic 1;
   
  _camera = "camera" camCreate [0,0,0];
  _camera camPrepareTarget [0,0,1];
  _camera cameraEffect ["internal", "BACK"];
  _camera camCommitPrepared 0;
     
  _camera camPrepareTarget [-48012.08,-72544.20,-17322.44];
  _camera camPreparePos [6606.63,9338.14,5.69];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;

   
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  playmusic "CELO_Cope_4";  


 
  sleep 3;
  
  
  _camera camPrepareTarget [-76581.15,-43229.84,-17369.10];
  _camera camPreparePos [6614.76,9366.28,4.43];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 8;
  sleep 7;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [14750.72,108858.20,5032.36];
  _camera camPreparePos [6573.96,9311.88,0.89];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [57105.52,95496.83,5071.45];
  _camera camPreparePos [6576.12,9337.23,1.71];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 12;
  sleep 11;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
   
  _camera camPrepareTarget [50367.75,-80465.14,-1140.90];
  _camera camPreparePos [6537.15,9405.22,4.80];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [79787.30,-58498.89,-1140.00];
  _camera camPreparePos [6384.74,9433.70,12.78];
  _camera camPrepareFOV 0.700;
  _camera camCommitPrepared 12;
  sleep 11;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};  
  
  
  sleep 2;
  
  _camera camPrepareFocus [-1,1];
  _camera CameraEffect ["Terminate", "Back"];
  CamDestroy _camera;

  titlecut ["","BLACK IN",2];

  sleep 2;
  
  savegame;
  0 fadesound 1;

};



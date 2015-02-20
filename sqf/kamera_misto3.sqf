
0 spawn {

  0 spawn {
    waitUntil {preloadCamera getpos m3_v1};
  };

  "colorCorrections" ppEffectAdjust [1, 1, -0.0025, [0.0, 0.0, 0.0, 0.0], [0.5, 0.5, 0.3, 0.25],  [0.199, 0.587, 0.114, 0.0]];
  "colorCorrections" ppEffectCommit 0;  
  "colorCorrections" ppEffectEnable true;
  0 fadesound 0;
  0 fademusic 1;
   
  _camera = "camera" camCreate [0,0,0];
  _camera camPrepareTarget [0,0,1];
  _camera cameraEffect ["internal", "BACK"];
  _camera camCommitPrepared 0;
     
  _camera camPrepareTarget [55418.64,-71515.03,29552.04];
  _camera camPreparePos [6169.86,10444.12,0.47];
  _camera camPrepareFOV 0.785;
  _camera camCommitPrepared 0;
   
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  playmusic "CELO_Cope_3";  


 
  sleep 3;
  
  
  _camera camPrepareTarget [82538.46,-49406.68,-23925.33];
  _camera camPreparePos [6151.76,10439.63,10.18];
  _camera camPrepareFOV 0.785;
  _camera camCommitPrepared 8;
  sleep 7;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [72094.20,60527.63,-55797.20];
  _camera camPreparePos [6195.11,10407.01,8.61];
  _camera camPrepareFOV 0.785;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [19600.26,-82815.35,-33328.62];
  _camera camPreparePos [6195.11,10407.01,8.61];
  _camera camPrepareFOV 0.785;
  _camera camCommitPrepared 12;
  sleep 11;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [-78139.71,-20319.06,-43753.53];
  _camera camPreparePos [6254.73,10449.54,47.27];
  _camera camPrepareFOV 0.785;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [-27103.96,92490.01,-46288.05];
  _camera camPreparePos [6225.56,10342.76,44.04];
  _camera camPrepareFOV 0.785;
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



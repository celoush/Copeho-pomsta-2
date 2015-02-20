
0 spawn {

  0 spawn {
    waitUntil {preloadCamera getpos m2_v1};
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
     
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [106398.22,15399.92,-8294.72];
  _camera camPreparePos [6861.23,11379.81,45.67];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  playmusic "CELO_Cope_2";  
 
  sleep 3;
  
  _camera camPrepareTarget [106398.22,15399.92,-8294.41];
  _camera camPreparePos [6687.13,11432.77,47.18];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 10;
  sleep 9;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [104186.70,-444.27,-19193.90];
  _camera camPreparePos [6846.55,11386.32,13.31];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [37629.84,106384.52,-5227.43];
  _camera camPreparePos [6916.57,11371.83,5.18];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 8;
  sleep 7;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [-13468.88,109234.69,-5276.16];
  _camera camPreparePos [6873.31,11467.38,2.03];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  
  _camera camPrepareTarget [-13477.96,109278.26,3369.73];
  _camera camPreparePos [6886.12,11431.89,1.37];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 10;
  sleep 9;
  titlecut ["","BLACK OUT",1];
  waitUntil {camCommitted _camera};
  titlecut ["","BLACK IN",1];
  
  _camera camPrepareTarget [8060.30,107858.94,-26108.93];
  _camera camPreparePos [6886.15,11338.19,51.69];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 0;
  waitUntil {camCommitted _camera};
  
  
  _camera camPrepareTarget [-57377.49,82411.96,-27851.56];
  _camera camPreparePos [7104.38,11213.75,132.30];
  _camera camPrepareFOV 0.488;
  _camera camCommitPrepared 15;
  sleep 14;
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
function scenario = buildCampusScenario()
cfg = campusConfig();

% Create scenario in local ENU frame
scenario = uavScenario("UpdateRate",100,"ReferenceLocation", ...
                       [cfg.lat0 cfg.lon0 cfg.alt0]);

% --- 1. Terrain mesh ----------------------------------------------
terrainID = addCustomTerrain("scuDEM",cfg.demFile);
addTerrain(scenario,"scuTerrain","SCU",terrainID);

% --- 2. Buildings --------------------------------------------------
bldgMesh = stlread(cfg.bldgFile);
bldgObj  = geopolyshape(bldgMesh.Points(:,1), ...
                        bldgMesh.Points(:,2));
addMesh(scenario,"BoundaryMesh",bldgObj, ...
        "Altitude",bldgMesh.Points(:,3),"Color",[0.8 0.8 0.8]);

% --- 3. Flight‑corridor fence -------------------------------------
corrENU = lla2enu(cfg.corridorLLA, ...
                  [cfg.lat0 cfg.lon0 cfg.alt0],cfg.proj);
patch("XData",corrENU(:,1),"YData",corrENU(:,2),"ZData", ...
      zeros(size(corrENU,1),1)+cfg.hMin, ...
      "FaceColor","none","EdgeColor","g","LineStyle","--");

% --- 4. Add wind & weather hooks ----------------------------------
scenario.UserData.windFcn = @windProfileFcn;

end

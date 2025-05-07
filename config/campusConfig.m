function cfg = campusConfig()
% Geographic & terrain assets for Santa Clara Univ. (example).

cfg.proj        = "+proj=utm +zone=10 +datum=WGS84 +units=m +no_defs";
cfg.lat0        = 37.3496;        % reference lat   (deg)
cfg.lon0        = -121.9381;      % reference lon   (deg)
cfg.alt0        = 35;             % ref ellipsoid alt (m)

% GeoTIFF of 1‑m USGS DEM you downloaded
cfg.demFile     = fullfile(pwd,"assets","scu_dem_1m.tif");

% CAD or CityGML of building footprints extruded to known heights
cfg.bldgFile    = fullfile(pwd,"assets","scu_buildings.stl");

% 2‑D corridor polygon (clockwise lat‑lon pairs)
cfg.corridorLLA = [ ...
    37.34917  -121.94350;
    37.35070  -121.94350;
    37.35070  -121.93290;
    37.34917  -121.93290 ];

% Altitude limits (AGL) for your BVLOS shielded corridor
cfg.hMin = 30;  % m
cfg.hMax = 60;  % m
end

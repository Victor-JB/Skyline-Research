function W = missionWaypoints()
cfg = campusConfig();
% Simple: center of corridor in, land at café, return to start
W = [...
    0 0  cfg.hMin+5;          % take‑off pad at origin
    200 0 cfg.hMax;           % climb & accelerate
    650 120 cfg.hMax;         % cruise inside corridor
    650 120 cfg.hMin+2;       % descend to drop‑off
    650 120 cfg.hMax;         % climb out
    0 0  cfg.hMin+5];         % home
end

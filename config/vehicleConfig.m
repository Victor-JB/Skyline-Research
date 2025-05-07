function p = vehicleConfig()
% Nominal Matrice‑class quad w/ 1 kg payload

p.mass          = 4.7;      % kg (incl. payload)
p.payloadMass   = 1.0;      % kg
p.battCap       = 850;      % Wh
p.battNomV      = 22.2;     % V (6 S Li‑ion)
p.propDiam      = 0.33;     % m
p.maxThrust     = 85;       % N (aggregate)
p.reservedSOC   = 0.20;     % 20% landing reserve
p.ctrlGains     = struct("Kp",4,"Kd",2); % simple PID placeholder
end

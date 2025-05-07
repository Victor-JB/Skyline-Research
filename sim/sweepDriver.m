battCap   = [650 850 1000];          % Wh
payload   = [0.5 1.0 1.5];           % kg
nRuns     = 50;                      % Monte‑Carlo wind seeds

results = table();

for C = battCap
  for P = payload
    parfor k = 1:nRuns
        seed = k; rng(seed);
        out = runMissionSim("battCap",C,"payloadMass",P);
        soc  = out.logsout.get('SOC').Values.Data(end);
        time = out.tout(end);
        results = [results; {C P seed soc time}]; %#ok<AGROW>
    end
  end
end
results.Properties.VariableNames = ...
    {'BattWh','PayloadKg','Seed','LandingSOC','FlightTime'};
writetable(results,"sweepResults.csv");

%RUNENVELOPE  Monte Carlo batch that regenerates the "Success vs. Failure" envelope figure.
%
% Replaces the loop in MonteCarlo.m with three fixes:
%   1. a bird hit no longer ends the whole batch (MonteCarlo.m used `break`)
%   2. every run is saved as it finishes, so a crash or Ctrl-C keeps the data
%   3. bird hits are scored from X_e (the model has no 'birdcrash' signal)
% Mass and thrust perturbation are switched ON (+-10%), as in the proposal figure.
%
% Usage (from sim/uavPackageDelivery):
%   >> N = 200; runEnvelope        % N defaults to 100
%   >> plotEnvelope('results/envelope_<stamp>.mat')     % re-plot any time

if ~exist('N', 'var') || isempty(N), N = 100; end
SEED = 1;

mdl = skylineSetup('Animate', false, 'SimTime', 120);   % no pacing, no animation
here = fileparts(which('runEnvelope'));
outDir = fullfile(here, 'results');
if ~exist(outDir, 'dir'), mkdir(outDir); end
outFile = fullfile(outDir, "envelope_" + datestr(now, 'yyyymmdd_HHMMSS') + ".mat");

rng(SEED);
results = struct([]);
for i = 1:N
    tic
    p = skylineSampleRun('MassPert', 'rand', 'ThrustPert', 'rand');
    try
        simOut = sim(mdl, 'ReturnWorkspaceOutputs', 'on');
        r = skylineScoreRun(simOut, p);
        r = rmfield(r, {'t', 'pos'});              % keep the file small
    catch ME
        warning('Run %d failed: %s', i, ME.message);
        continue
    end
    results = [results; r]; %#ok<AGROW>
    save(outFile, 'results', 'SEED', 'N');
    fprintf('Run %3d/%d  mass %.2f  windRMS %.1f  pert %4.1f%%  err %5.2f m  status %d  (%.0f s)\n', ...
        i, N, r.mass, r.windRMS, 100*r.perturbation, r.error, r.status, toc);
end

fprintf('\nSaved %d runs to %s\n', numel(results), outFile);
plotEnvelope(outFile);

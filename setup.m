%% Project Configuration Script (setup.m)
% Automatically adds all source and data subfolders to the MATLAB path.

rootPath = fileparts(mfilename('fullpath'));

fprintf('Configuring USRP Image Transfer environment...\n');

% Generate and add paths for everything inside 'src' and 'data'
srcPaths = genpath(fullfile(rootPath, 'src'));
dataPaths = genpath(fullfile(rootPath, 'data'));

if ~isempty(srcPaths)
    addpath(srcPaths);
    fprintf('  [+] All folders inside "src" have been added.\n');
end

if ~isempty(dataPaths)
    addpath(dataPaths);
    fprintf('  [+] All folders inside "data" have been added.\n');
end

% Attempt path preservation
if savepath == 0
    fprintf('Configuration successfully saved to MATLAB search path.\n');
else
    fprintf('[-] Note: Path changes are temporary for this session.\n');
end

fprintf('Configuration completed.\n');
clear rootPath srcPaths dataPaths;
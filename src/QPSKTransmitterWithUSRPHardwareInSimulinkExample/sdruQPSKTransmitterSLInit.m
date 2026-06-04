function SimParams = sdruQPSKTransmitterSLInit(platform, useCodegen, isHDLCompatible, image_matrix)
%   Copyright 2023-2024 The MathWorks, Inc.

%% General simulation parameters

if isHDLCompatible
    SimParams.Rsym = 0.5e6;          % Symbol rate in Hertz
                                   % If HDL compatible, code will not be optimized in performance
else
    if useCodegen
        SimParams.Rsym = 5e6;      % Symbol rate in codegen path
    else
        SimParams.Rsym = 2.5e6;
    end
end

SimParams.ModulationOrder = 4;      % QPSK alphabet size
SimParams.Interpolation = 2;        % Interpolation factor
SimParams.Decimation = 1;           % Decimation factor
SimParams.Tsym = 1/SimParams.Rsym;  % Symbol time in sec
SimParams.Fs   = SimParams.Rsym * SimParams.Interpolation; % Sample rate

%% Frame Specifications
% [BarkerCode*2 | 'Hello world 000\n' | 'Hello world 001\n' ...];
SimParams.BarkerCode      = [+1 +1 +1 +1 +1 -1 -1 +1 +1 -1 +1 -1 +1];     % Bipolar Barker Code
SimParams.BarkerLength    = length(SimParams.BarkerCode);
SimParams.HeaderLength    = SimParams.BarkerLength * 2;                   % Duplicate 2 Barker codes to be as a header
SimParams.MessageLength   = 16;                              
SimParams.NumberOfMessage = 100;                                          % Number of messages in a frame
SimParams.PayloadLength   = SimParams.NumberOfMessage * SimParams.MessageLength * 7; % 7 bits per characters
SimParams.FrameSize       = (SimParams.HeaderLength + SimParams.PayloadLength) ...
    / log2(SimParams.ModulationOrder);                                    % Frame size in symbols
SimParams.FrameTime       = SimParams.Tsym*SimParams.FrameSize;

%% Tx parameters
SimParams.RolloffFactor     = 0.5;                                        % Rolloff Factor of Raised Cosine Filter
SimParams.ScramblerBase     = 2;
SimParams.ScramblerPolynomial           = [1 1 1 0 1];
SimParams.ScramblerInitialConditions    = [0 0 0 0];
SimParams.RaisedCosineFilterSpan = 10; % Filter span of Raised Cosine Tx Rx filters (in symbols)

%% Message generation
SimParams.MessageBits = image_matrix;

%% USRP transmitter parameters
switch platform
  case {'B200','B210'}
    SimParams.MasterClockRate = 20e6;           % Hz
  case {'X300','X310'}
    SimParams.MasterClockRate = 200e6;          % Hz
  case {'X410'}
    SimParams.MasterClockRate = 250e6;          % Hz
  case {'E320'}
    SimParams.MasterClockRate = 50e6;          % Hz
  case {'N300','N310'}
    SimParams.MasterClockRate = 125e6;          % Hz
  case {'N320/N321'}
    SimParams.MasterClockRate = 200e6;          % Hz
  case {'N200/N210/USRP2'}
    SimParams.MasterClockRate = 100e6;          % Hz
  otherwise
    error(message('sdru:examples:UnsupportedPlatform', ...
      platform))
end
SimParams.USRPCenterFrequency       = 915e6;
SimParams.USRPGain                  = 25;
SimParams.USRPFrontEndSampleRate    = SimParams.Rsym * 2; % Nyquist sampling theorem
SimParams.USRPInterpolationFactor   = SimParams.MasterClockRate/SimParams.USRPFrontEndSampleRate;
SimParams.USRPFrameLength           = SimParams.Interpolation * SimParams.FrameSize;

% Experiment Parameters
SimParams.USRPFrameTime = SimParams.USRPFrameLength/SimParams.USRPFrontEndSampleRate;
SimParams.StopTime = 1000;
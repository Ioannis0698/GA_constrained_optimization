% MSV (Machine State Vector) definition: basic design parameter structure
% 11/2018 M.Beniakar

% Define a struct, for example 'MotorEntity' or 'Motor' or whatever suits you
% Any equivalent variation of basic parameters is acceptable
MotorEntity.Name                                        = 'PMSynRM';                             % Permanent Magnet Assisted Synchronous Reluctance Motor 
%% Basic parameters
MotorEntity.Configuration.Poles                         = 6;
MotorEntity.Configuration.Phases                        = 3;
MotorEntity.Configuration.AirGap                        = 0.7;                                  % air-gap length in mm
MotorEntity.Configuration.ActiveLength                  = 100;                                  % motor active length in mm
MotorEntity.Configuration.FillFactor                    = 0.6;                                  % stator slot fill factor 
MotorEntity.Configuration.NominalCurrentDensity         = 4;                                    % stator slot current density nominal in A/mm^2

%% Stator Configuration
MotorEntity.Configuration.Stator.OuterRadius            = 100;                                   % stator outer radius in mm - Rso (initial=52)
MotorEntity.Configuration.Stator.Spp                    = 2;                                    % number of slots per pole per phase (q)
MotorEntity.Configuration.Stator.Yoke2toothNormalized   = 1.8;                                  % yoke takes * times times the tooth width (YokeWidth=Yoke2toothNormalized*ToothWidth)%(initial:1.3)
MotorEntity.Configuration.Stator.Tooth2SlotPercentage   = 60;% percentage of tooth width to slot pitch (usually defined on the stator inner radius Tooth2SlotPercentage=ToothWidth/SlotPitch)
MotorEntity.Configuration.Stator.ToothParallelization   = 100;                                  % 100% means parallel tooth by default
MotorEntity.Configuration.Stator.Edges                  = 1;                                 % radius of the smoothing of stator slots (for fillet definition)(initial:1.25)

MotorEntity.Configuration.Stator.ToothTips              = 80;                                   % percentage of tooth tips width to slot pitch (ToothTips=ToothTipsWidth/SlotPitchAngle)
MotorEntity.Configuration.Stator.Tips2Tooth             = 10;                                   % percentage of tooth tips total height to tooth length (Ltooth = Rso-Rsi-YokeWidth)
MotorEntity.Configuration.Stator.Tips2Tips              = 80;                                   % percentage of tooth tips lower part height to total tooth tip height (initial:40)

%% Winding Configuration
MotorEntity.Configuration.Winding.PoleTurns             = 50;                                   % total Turns per pole
MotorEntity.Configuration.Winding.Layers                = 2;                                    % winding layers (for you it's 2)
MotorEntity.Configuration.Winding.Overlap               = 1;                                    % number of slots that winding is shift between layers


%% Rotor Configuration 
% Basic dimensions and materials
MotorEntity.Configuration.Rotor.Radius                  = 70;%130;                                  % outer rotor radius including magnets - Rro (initial=35)
MotorEntity.Configuration.Rotor.InnerRadius             = 35;%55;                                   % rotor inner radius that defines yoke - Rri (initial=15)
MotorEntity.Configuration.Rotor.Barrier2EdgePercentage  = 960;                                 % percentage(/1000) of the barrier near Rro
MotorEntity.Configuration.Rotor.InnerBarrierAnglePercentage = 50;
% Magnet dimensions
MotorEntity.Configuration.Rotor.MagnetDC                = 75;                                   % magnet arc/pole pitch in (%)  
MotorEntity.Configuration.Rotor.MagnetHeight            = 2;                                    % height of the magnet (mm)
% Magnet Dimension
% MotorEntity.Configuration.Rotor.MagnetWidth1            = 24;                                  % Magnet Width 1st Barrier(mm)(initial=3)
MotorEntity.Configuration.Rotor.MagnetWidth2            = 15;                                  % Magnet Width 2nd Barrier(mm)(initial=1.8)
MotorEntity.Configuration.Rotor.MagnetWidth3            = 6;                                   % Magnet Width 3rd Barrier (mm)(initial=1.4)
% MotorEntity.Configuration.Rotor.MagnetLength2Pocket     = 30;                                   % Magnet Length / PocketLength(ab) (%)
% MotorEntity.Configuration.Rotor.InnerBarrierAnglePercentage = 0
%% Vectors
% Normal Conditions
% Mechanical Angle For Simulations
MotorEntity.Vectors.MechAngle                                         = linspace(0,360,91);%(0,360,46);%60 initial% Mechanical Angle (Elec Deg)
% MotorEntity.Vectors.MechAngle_Ripple                                  = linspace(0,120,121);          % Mechanical Angle (Elec Deg)
% MotorEntity.Vectors.CurrentAngle                                      = linspace(0,180,91);          % Current Angle 
MotorEntity.Vectors.MechAngle_opt = linspace(0,360,46);

% Normal Operationg Condition
MotorEntity.Vectors.Current                                           = linspace(10,100,8);          % Current Amplitude percentage (0-100)
MotorEntity.Vectors.IEA                                               = linspace(0,180,16); %(40,180,14);         % Internal Electric Angle
MotorEntity.Vectors.Temperature                                       = 60;                          % Temperature
MotorEntity.Vectors.Frequency                                         = linspace(0,50,63.5);         % Frequency

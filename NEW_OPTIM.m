clc;
clear all;

% Replace directory here and add it to Matlab path
dir_Database = 'D:\NTUA\9o eksamhno\kataskeuh mhxanwn\giannopoulos functions';
cd(dir_Database);
% addpath(genpath(dir_Database));
addpath(genpath(dir_Database));

% Add femm m-files to Matlab path
addpath('C:\femm42\mfiles');

%%
% Define the lower and upper bounds for variables
lb = [20, 0, 30];
ub = [40, 100, 90];

% Set up the GA options
options = optimoptions('ga', ...
    'PopulationSize', 20, ... %20
    'MaxGenerations', 20, ... %30
    'FunctionTolerance', 1e-6, ...
    'EliteCount', 2, ...
    'CrossoverFraction', 0.8, ...
    'OutputFcn', @displayFval, ... % Custom output function
    'PlotFcn', @gaplotbestf);

% Create an anonymous function handle for the optimization
fcn = @(x) obj_func(x);

% Run the GA optimization
[x, fval, exitFlag, output, population, scores] = ga(fcn, 3, [], [], [], [], lb, ub, [], options);

disp('Optimal solution:');
disp('x1:'); disp(x(1));
disp('x2:'); disp(x(2));
disp('x3:'); disp(x(3));
disp('Final objective function value:'); disp(fval);
global V
Values = V;
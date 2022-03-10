clc
clear all
close all


run('lib/addpath_recurse');
addpath_recurse('lib/');
addpath_recurse('src/');

maxRFP=1e4;
maxCFP=1e5;
minOD=0.05;
maxOD=.5;

%% tyrA-leuB

figDir='../../figures/src/';

h='24';
dataDir='../../data/processed/';

expeDir='tyrA-leuB/';
strainA='Y';
strainB='L';
strain50='50';

% LOAD DATA
loadCheckerboards;

% PLOT DATA
setColors();
plotCheckerboards;

%% pheA-leuB
expeDir='pheA-leuB/';
strainA='F';
strainB='L';
strain50='50';

% LOAD DATA
loadCheckerboards;

% PLOT DATA
setColors();
cmap_freqs=flipud(colormap_football(201, 'freqs'));
plotCheckerboards;
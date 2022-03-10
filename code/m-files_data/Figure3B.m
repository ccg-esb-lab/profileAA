clc
close all
clear all

run('lib/addpath_recurse');
addpath_recurse('src/');
addpath_recurse('lib/');

%% LOAD DATA

dataPath='../../data/processed/';
dataFile_data='data_alpha_matrix.txt';

label_strains={'F','G','H','I','L','M','T','W','Y'};
name_strains={'PheA','gliA','HisB','IlvA','LeuB','metA','thrC','trpC','tyrA'};

%Read data (experiment)
M_data=textread([dataPath,dataFile_data]);

for i1= 1:length(label_strains)
   for i2=1:length(label_strains)
       if i1~=i2
        disp([name_strains{i1},'-',name_strains{i2},'= ',num2str(M_data(i1,i2))]); 
       end
   end
end

%
mean_alpha_data=mean(M_data(M_data~=0));
M_cuttoff_data=mean_alpha_data;
M_data=M_data-M_cuttoff_data;
M_data(M_data<0)=0;

cm_data=zeros(length(M_data), 3);

% PLOT CIRCULAR NETWORK
circularGraph(M_data,'Colormap',cm_data,'Label',label_strains);


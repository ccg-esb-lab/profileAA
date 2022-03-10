

%% SYNERGY (CFP)

dataCFP_BA_rep1_A=importdata([dataDir,expeDir,'rep1/eCyan/CYAN_',strainA,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_rep2_A=importdata([dataDir,expeDir,'rep2/eCyan/CYAN_',strainA,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_rep3_A=importdata([dataDir,expeDir,'rep3/eCyan/CYAN_',strainA,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_A=(1/maxCFP)*(dataCFP_BA_rep3_A.data+dataCFP_BA_rep2_A.data+dataCFP_BA_rep1_A.data)/3;

dataCFP_BA_rep1_B=importdata([dataDir,expeDir,'rep1/eCyan/CYAN_',strainB,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_rep2_B=importdata([dataDir,expeDir,'rep2/eCyan/CYAN_',strainB,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_rep3_B=importdata([dataDir,expeDir,'rep3/eCyan/CYAN_',strainB,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_B=(1/maxCFP)*(dataCFP_BA_rep3_B.data+dataCFP_BA_rep2_B.data+dataCFP_BA_rep1_B.data)/3;

dataCFP_BA_rep1_50=importdata([dataDir,expeDir,'rep1/eCyan/CYAN_',strain50,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_rep2_50=importdata([dataDir,expeDir,'rep2/eCyan/CYAN_',strain50,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_rep3_50=importdata([dataDir,expeDir,'rep3/eCyan/CYAN_',strain50,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataCFP_BA_50=(1/maxCFP)*(dataCFP_BA_rep3_50.data+dataCFP_BA_rep2_50.data+dataCFP_BA_rep1_50.data)/3;

%Subtract background
dataCFP_BA_A_bg=dataCFP_BA_A-minOD;
dataCFP_BA_B_bg=dataCFP_BA_B-minOD;
dataCFP_BA_50_bg=dataCFP_BA_50-minOD;

%% SYNERGY (RFP)

dataRFP_BA_rep1_A=importdata([dataDir,expeDir,'rep1/mCherry/MCHERRY_',strainA,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_rep2_A=importdata([dataDir,expeDir,'rep2/mCherry/MCHERRY_',strainA,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_rep3_A=importdata([dataDir,expeDir,'rep3/mCherry/MCHERRY_',strainA,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_A=(1/maxRFP)*(dataRFP_BA_rep3_A.data+dataRFP_BA_rep2_A.data+dataRFP_BA_rep1_A.data)/3;

dataRFP_BA_rep1_B=importdata([dataDir,expeDir,'rep1/mCherry/MCHERRY_',strainB,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_rep2_B=importdata([dataDir,expeDir,'rep2/mCherry/MCHERRY_',strainB,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_rep3_B=importdata([dataDir,expeDir,'rep3/mCherry/MCHERRY_',strainB,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_B=(1/maxRFP)*(dataRFP_BA_rep3_B.data+dataRFP_BA_rep2_B.data+dataRFP_BA_rep1_B.data)/3;

dataRFP_BA_rep1_50=importdata([dataDir,expeDir,'rep1/mCherry/MCHERRY_',strain50,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_rep2_50=importdata([dataDir,expeDir,'rep2/mCherry/MCHERRY_',strain50,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_rep3_50=importdata([dataDir,expeDir,'rep3/mCherry/MCHERRY_',strain50,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataRFP_BA_50=(1/maxRFP)*(dataRFP_BA_rep3_50.data+dataRFP_BA_rep2_50.data+dataRFP_BA_rep1_50.data)/3;

%Subtract background
dataRFP_BA_A_bg=dataRFP_BA_A-minOD;
dataRFP_BA_B_bg=dataRFP_BA_B-minOD;
dataRFP_BA_50_bg=dataRFP_BA_50-minOD;

%% SYNERGY (OD600)

dataOD_BA_rep1_A=importdata([dataDir,expeDir,'rep1/OD/OD_',strainA,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_rep2_A=importdata([dataDir,expeDir,'rep2/OD/OD_',strainA,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_rep3_A=importdata([dataDir,expeDir,'rep3/OD/OD_',strainA,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_A=(dataOD_BA_rep3_A.data+dataOD_BA_rep2_A.data+dataOD_BA_rep1_A.data)/3;

dataOD_BA_rep1_B=importdata([dataDir,expeDir,'rep1/OD/OD_',strainB,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_rep2_B=importdata([dataDir,expeDir,'rep2/OD/OD_',strainB,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_rep3_B=importdata([dataDir,expeDir,'rep3/OD/OD_',strainB,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_B=(dataOD_BA_rep3_B.data+dataOD_BA_rep2_B.data+dataOD_BA_rep1_B.data)/3;

dataOD_BA_rep1_50=importdata([dataDir,expeDir,'rep1/OD/OD_',strain50,'_R1_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_rep2_50=importdata([dataDir,expeDir,'rep2/OD/OD_',strain50,'_R2_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_rep3_50=importdata([dataDir,expeDir,'rep3/OD/OD_',strain50,'_R3_',h,'h_',strainA,strainB,'.txt']);
dataOD_BA_50=(dataOD_BA_rep3_50.data+dataOD_BA_rep2_50.data+dataOD_BA_rep1_50.data)/3;

%Subtract background
dataOD_BA_A_bg=dataOD_BA_A-minOD;
dataOD_BA_B_bg=dataOD_BA_B-minOD;
dataOD_BA_50_bg=dataOD_BA_50-minOD;

%% SYNERGY (Relative Frequency)

relFreq_BA_A=dataRFP_BA_A_bg./(dataRFP_BA_A_bg+dataCFP_BA_A_bg);
relFreq_BA_B=dataRFP_BA_B_bg./(dataRFP_BA_B_bg+dataCFP_BA_B_bg);
relFreq_BA_50=dataRFP_BA_50_bg./(dataRFP_BA_50_bg+dataCFP_BA_50_bg);


%% SYNERGY (Relative Density)

relDensity_50=dataOD_BA_50_bg-(dataOD_BA_A_bg + dataOD_BA_B_bg)/2;


%% SYNERGY (DYNAMICS)

density_BA_A=dataOD_BA_A;
density_BA_B=dataOD_BA_B;
density_BA_50=dataOD_BA_50;

dynM=ones(size(density_BA_A));

competition_AB= find(density_BA_50<(density_BA_A+density_BA_B)/2);
dynM(competition_AB)=4;

exclusion_A= find(density_BA_B>minOD & density_BA_A<minOD);

exclusion_B= find(density_BA_A>minOD & density_BA_B<minOD);

extinction_AB= find(density_BA_50<minOD);

parasitism_A=find(density_BA_50>(density_BA_A+density_BA_B)/2);
dynM(parasitism_A)=3;

mutualism_AB= find(density_BA_50>density_BA_B & density_BA_50>density_BA_A);
dynM(mutualism_AB)=2;


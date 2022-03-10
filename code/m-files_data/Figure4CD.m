
clc
clear all
close all

run('lib/addpath_recurse');
addpath_recurse('lib/');

%%

dataDir='../../data/processed/tyrA-leuB/iniFreq/';
dataFile='Freq_cocultivos.txt';

fileID   = fopen([dataDir,dataFile]);
data = textscan(fileID,'%s %s %f %f %f %f %f %f'); %format: cepa1	cepa2	proporcion1	proporcion2	OD	mCherry	eCyan	replica
fclose(fileID);

%%
strain1='tyrA';
strain2='leuB';

indx1=find(strcmp(data{1}, strain1));
indx2=find(strcmp(data{2}, strain2));
indx = intersect(indx1,indx2);

rawIniFreq=data{3}(indx);
rawOD=data{5}(indx);
rawRFP=data{6}(indx);
rawCFP=data{7}(indx);
rawRep=data{8}(indx);

numFreqs=length(unique(rawIniFreq));
numReps=length(unique(rawRep));

dataIniFreq=reshape(rawIniFreq, [numFreqs, numReps])';
dataCFP=reshape(rawCFP, [numFreqs, numReps])';
dataRFP=reshape(rawRFP, [numFreqs, numReps])';
dataOD=reshape(rawOD, [numFreqs, numReps])';
dataRep=reshape(rawRep, [numFreqs, numReps])';


%% Normalize fluorescent intensities

normdataCFP=(dataCFP-min(mean(dataCFP)))./(max(mean(dataCFP))-min(mean(dataCFP)));
normdataRFP=(dataRFP-min(mean(dataRFP)))./(max(mean(dataRFP))-min(mean(dataRFP)));

meanOD=mean(dataOD);
steOD=std(dataOD)/sqrt(numReps);

meanCFP=mean(normdataCFP);
steCFP=std(normdataCFP)/sqrt(numReps);

meanRFP=mean(normdataRFP);
steRFP=std(normdataRFP)/sqrt(numReps);

%%  PLOT OD

figure();
clf('reset');set(gcf,'DefaultLineLineWidth',1); set(gcf, 'color', 'white'); hold all

inifreqs=0:.1:1;

inifreqticks=[0 .5 1];
inifreqlabels={strain1,'50-50',strain2};

errorbar(inifreqs, meanOD,steOD, 'o','Color','k','MarkerFaceColor','k','MarkerSize',8); hold on;

plot(inifreqs, meanOD,'ok', 'MarkerFaceColor','k'); hold on;
plot(inifreqs, meanOD,':k', 'LineWidth',1); hold on;

set(gca,'FontSize',20)
xlabel('Initial Frequency (%)','FontSize',24);
ylabel('\Delta OD_{630}','FontSize',24);
xlim([-.05 1.05])
ylim([-.01 0.2])

xticklabels(inifreqlabels)
xticks(inifreqticks)

%% NORMALIZED FLOURESCENT INTENSITIES


figure();
clf('reset');set(gcf,'DefaultLineLineWidth',1); set(gcf, 'color', 'white'); hold all
inifreqs=0:.1:1;

inifreqticks=[0 .5 1];
inifreqlabels={strain1,'50-50',strain2};

plot(inifreqs, meanRFP, ':','MarkerFaceColor',[0.94902     0.62353    0.019608],'Color',[0.94902     0.62353    0.019608],'LineWidth',2,'MarkerSize',8); hold on;
p1=errorbar(inifreqs, meanRFP, steRFP, 'o','Color',[0.94902     0.62353    0.019608],'MarkerFaceColor',[0.94902     0.62353    0.019608],'LineWidth',1); hold on;
plot(inifreqs, meanRFP, 'o','MarkerFaceColor',[0.94902     0.62353    0.019608],'Color','k','LineWidth',1,'MarkerSize',8); hold on;

plot(inifreqs, meanCFP, ':','MarkerFaceColor',[0.36863     0.56471     0.94902],'Color',[0.36863     0.56471     0.94902],'LineWidth',1,'MarkerSize',8); hold on;
p2=errorbar(inifreqs, meanCFP, steCFP, ':o','Color',[0.36863     0.56471     0.94902],'MarkerFaceColor',[0.36863     0.56471     0.94902],'LineWidth',1); hold on;
plot(inifreqs, meanCFP, 'o','MarkerFaceColor',[0.36863     0.56471     0.94902],'Color','k','LineWidth',1,'MarkerSize',8); hold on;

set(gca,'FontSize',20)
xlabel('Initial Frequency (%)','FontSize',24);
ylabel('Normalized fluorescent intensity','FontSize',24);
xlim([0 1])
ylim([0 1])
legend([p1,p2],{'mCherry','CFP'},'Location','south','FontSize',20)

xticklabels(inifreqlabels)
xticks(inifreqticks)


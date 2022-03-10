clc
close all
clear all

run('lib/addpath_recurse');
addpath_recurse('src/');
addpath_recurse('lib/');

%% LOAD DATA

dataPath='../../data/processed/growthCurves/';
dataFile_OD600_LY='LY_OD.csv';
DATA_OD600 = readtable([dataPath,dataFile_OD600_LY],'ReadVariableNames', 1);

maxOD=max(max(DATA_OD600{2:end,2:end}));
minOD=min(max(DATA_OD600{2:end,2:end}));

%% PLOT GROWTH CURVES

figure();
clf('reset');set(gcf,'DefaultLineLineWidth',4); set(gcf, 'color', 'white'); hold all
set(gcf, 'Position', [100 100 1500 300])
nreps=7;

ini_freqs_L=[100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0];
nfreqs=length(ini_freqs_L);

rep_Ps=zeros(nfreqs, nreps);

for i=1:nfreqs
    
    reps_OD=[];
    
    for rep=1:nreps
        
        this_iniFreq=ini_freqs_L(i);
        if this_iniFreq==0
            this_label=['rep',num2str(rep),'_',num2str(100-this_iniFreq),'Y'];
        elseif this_iniFreq==100
            this_label=['rep',num2str(rep),'_',num2str(this_iniFreq),'L'];
        else
            this_label=['rep',num2str(rep),'_',num2str(this_iniFreq),'L_',num2str(100-this_iniFreq),'Y'];
        end
        
        
        if ismember(this_label,DATA_OD600.Properties.VariableNames)
            
            subaxis(1,length(ini_freqs_L),length(ini_freqs_L)-i+1,'SpacingHoriz',0.01,'PaddingBottom',0.1);
            
            this_times=DATA_OD600.Time;
            
            this_OD=eval(['DATA_OD600.',this_label,'']);
            reps_OD=[reps_OD this_OD];
            
            rep_P = polyfit(this_times, exp(this_OD),1);
            rep_Ps(i, rep)=rep_P(1);
        end
    end
    
    meanOD=mean(reps_OD,2)-mean(reps_OD(1,:)); %bg
    steOD=ste(reps_OD')';
    
    h=area(this_times,[meanOD-steOD,2*steOD],'FaceColor',[1           1     0.83922]); hold on;
    set(h(1),'FaceColor','w','EdgeColor','none')
    
    plot(this_times, meanOD, '-k','LineWidth', 3); hold on;
    plot(this_times, meanOD-steOD, '-','LineWidth', 1,'Color',[.4 .4 .4])
    plot(this_times, meanOD+steOD, '-','LineWidth', 1,'Color',[.4 .4 .4])
    
    title([num2str(this_iniFreq),'L/',num2str(100-this_iniFreq),'Y']);
    
    if i<nfreqs
        yticks([]);
    else
        ylabel('OD_{600}','FontSize',20);
        
    end
    
    if i==6
        xlabel('Time (hours)','FontSize',20);
    end
    set(gca,'FontSize', 16)
    xlim([0, max(this_times)]);
    ylim([0, 0.08]);
    xticks(0:.25:.75);
    xticklabels(0:6:18);
    
    
end

figPath='../../figures/src/';
eval(['export_fig ',figPath,'Figure4A.png'])

%% PLOT INIFREQ VS GROWTH RATE

figure();
clf('reset');set(gcf,'DefaultLineLineWidth',2); set(gcf, 'color', 'white'); hold all

Ps=[];
for i=1:nfreqs
    
    this_Ps=rep_Ps(i,rep_Ps(i,:)>0);
    meanPs=mean(this_Ps);
    stePs=ste(this_Ps);
    
    Ps=[Ps meanPs];
    
    errorbar(ini_freqs_L(i), meanPs,stePs, 'ok'); hold on;
    
end
plot(ini_freqs_L, Ps,'ok', 'MarkerFaceColor','k'); hold on;
plot(ini_freqs_L, Ps,':k', 'LineWidth',1); hold on;

ylim([-0.01, .11])
xlim([-5 105])
xticks(0:50:100);
xticklabels({'tyrA','50-50', 'leuB'});
set(gca,'FontSize', 20)
xlabel('Initial Frequency (%)','FontSize',24)
ylabel('Maximum growth rate','FontSize',24)


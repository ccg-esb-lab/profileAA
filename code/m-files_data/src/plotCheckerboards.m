
    
%% SYNERGY (Relative Frequency)


%CHECKERBOARD A
figure(); clf('reset'); set(gcf,'DefaultLineLineWidth',2); set(gcf, 'color', 'white'); set(gca,'fontsize',20);
subaxis(1,1,1,'PaddingBottom',.1,'PaddingRight',0.1,'PaddingLeft',0.1);
colormap(cmap_freqs)
imagesc(rot90(relFreq_BA_A), 'AlphaData', rot90(dataOD_BA_A./maxOD)) %, 'AlphaData', rot90(dataOD_BA_A./maxOD)
%title([strainA,' (0-100)'],'FontSize',20);
hc=colorbar;
caxis([0, 1]);
set(gca,'YTick',(1:4:18),'FontSize',14)
set(gca,'XTick',(1:4:18),'FontSize',14)    
set(gca,'YTickLabel',{'4X','3X','2X','1X','0X'})
set(gca,'XTickLabel',{'0X','1X','2X','3X','4X'})
set(gca,'FontSize',20);
xlabel(strainA,'FontSize',24);
ylabel(strainB,'FontSize',24);

%CHECKERBOARD B
figure(); clf('reset'); set(gcf,'DefaultLineLineWidth',2); set(gcf, 'color', 'white'); set(gca,'fontsize',20);
subaxis(1,1,1,'PaddingBottom',.1,'PaddingRight',0.1,'PaddingLeft',0.1);
colormap(cmap_freqs)
imagesc(rot90(relFreq_BA_B), 'AlphaData', rot90(dataOD_BA_B./maxOD))
%title([strainB,' (100-0)'],'FontSize',20);
hc=colorbar;
caxis([0, 1]);
set(gca,'YTick',(1:4:18),'FontSize',14)
set(gca,'XTick',(1:4:18),'FontSize',14)    
set(gca,'YTickLabel',{'4X','3X','2X','1X','0X'})
set(gca,'XTickLabel',{'0X','1X','2X','3X','4X'})
set(gca,'FontSize',20);
xlabel(strainA,'FontSize',24);
ylabel(strainB,'FontSize',24);

%CHECKERBOARD 50
figure(); clf('reset'); set(gcf,'DefaultLineLineWidth',2); set(gcf, 'color', 'white'); set(gca,'fontsize',20);
subaxis(1,1,1,'PaddingBottom',.1,'PaddingRight',0.1,'PaddingLeft',0.1);
colormap(cmap_freqs)
imagesc(rot90(relFreq_BA_50), 'AlphaData', rot90(dataOD_BA_50./maxOD))
%title([strain50,' (50-50)'],'FontSize',20);
hc=colorbar;
caxis([0, 1]);
set(gca,'YTick',(1:4:18),'FontSize',14)
set(gca,'XTick',(1:4:18),'FontSize',14)    
set(gca,'YTickLabel',{'4X','3X','2X','1X','0X'})
set(gca,'XTickLabel',{'0X','1X','2X','3X','4X'})
set(gca,'FontSize',20);
xlabel(strainA,'FontSize',24);
ylabel(strainB,'FontSize',24);

%% SYNERGY (Relative Density)

figure(); clf('reset'); set(gcf,'DefaultLineLineWidth',2); set(gcf, 'color', 'white'); set(gca,'fontsize',20);
subaxis(1,1,1,'PaddingBottom',.1,'PaddingRight',0.1,'PaddingLeft',0.1);
colormap(cmap_bristol)
imagesc(rot90((relDensity_50)))
hc=colorbar();
caxis([-.15, .15]);

set(gca,'YTick',(1:4:18),'FontSize',14)
set(gca,'XTick',(1:4:18),'FontSize',14)    
set(gca,'YTickLabel',{'4X','3X','2X','1X','0X'})
set(gca,'XTickLabel',{'0X','1X','2X','3X','4X'})
set(gca,'FontSize',20);

xlabel(strainA,'FontSize',24);
ylabel(strainB,'FontSize',24);


%% SYNERGY (DYNAMICS)

figure(); clf('reset'); set(gcf,'DefaultLineLineWidth',2); set(gcf, 'color', 'white'); set(gca,'fontsize',20);
subaxis(1,1,1,'PaddingBottom',.1,'PaddingRight',0.1,'PaddingLeft',0.1);
colormap(cmap_profile)
imagesc(rot90(dynM)) %, 'AlphaData', rot90(density_BA_50./maxOD)
hc=colorbar('Ytick',.5+[2 3 4],'Yticklabel',{'Mutualism','Parasitism','Competition'});
caxis([2,5]);

set(gca,'YTick',(1:4:18),'FontSize',14)
set(gca,'XTick',(1:4:18),'FontSize',14)    
set(gca,'YTickLabel',{'4X','3X','2X','1X','0X'})
set(gca,'XTickLabel',{'0X','1X','2X','3X','4X'})

set(gca,'FontSize',20);
xlabel(strainA,'FontSize',24);
ylabel(strainB,'FontSize',24);




clear all;
close all;
set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize', 11)
% set(gcf, 'PaperSize', [8.5 6]); %size in cm

% load('results.mat')
% [frequ ampl] = textread(['ttl8ttlovercq1_TWGMRmd138666_TLasmd2460Uatto2dV0.00666UtisalamV6666.dat'],'%f %f', 'delimiter', ',');
set(gcf,'WindowStyle','docked')

exp_pulse = load('ttl8ttlovercq1_TWGMRmd138666_TLasmd2460Uatto2dV0.00666UtisalamV6666.mat');

time_s = exp_pulse.results.X1;
time_mus = time_s.*10^6 + .5;
frequ_MHz = exp_pulse.results.x1MHz;
pulse_greenDet_V = exp_pulse.results.Y2;

%EVALUATION
frequ_MHz = frequ_MHz - 0;
% stretch = 7.8/6.9;
stretch = 1;
frequ_MHz = stretch.*frequ_MHz;

clf
% set(gcf,'WindowStyle','docked')
hold on
    plot(time_mus,pulse_greenDet_V / max(pulse_greenDet_V),'Color',[0 .604 0],'MarkerSize',8,'LineWidth',.8)
hold off

% title('file: ttl8ttlovercq1_TWGMRmd138666_TLasmd2460Uatto2dV0.00666UtisalamV6666.mat','FontSize',6,'FontName','Times New Roman')

xlabel('Time (\mus)','FontSize',11,'FontName','Times New Roman')
% xlabel('Frequency (GHz)','FontSize',10,'FontName','Times New Roman')
% ylabel('Pump power (norm.)','FontSize',11,'FontName','Times New Roman')
% leg = legend('150 MHz Det',1, 'FontName' ,'Times New Roman','FontSize',8)
% set(leg,'box','off');
%,'Xcolor',[1 1 1],'Ycolor',[1 1 1]
box on
grid off
xlim([-0.5,6])
ylim([-0.05,1.05])
% set(leg,'FontSize',11,'FontName','Times New Roman')
set(gca,'FontSize',11,'FontName','Times New Roman')

%Export figure
set(gcf,'PaperUnits','Centimeter')
%set(gcf, 'PaperSize', [6 7]); %Keep the same paper size
%set(gcf, 'PaperPosition', [0 0.1 5.5 6.5]); %left up width heigt Position the plot further to the left and down. Extend the plot to fill entire paper.
set(gcf, 'PaperSize', [6 3.5]); %Keep the same paper size
set(gcf, 'PaperPosition', [0 0.1 5.5 2.7]); %left up width heigt Position the plot further to the left and down. Extend the plot to fill entire paper.

% saveas(gcf,['pump_mode.png'],'png')
savedata = ([time_mus,pulse_greenDet_V]);
dlmwrite(['fast_pulses.dat'],savedata, 'delimiter','\t' ,'newline' , 'pc' )
saveas(gcf,['green_pump_pulse_crit_V1.pdf'],'pdf')

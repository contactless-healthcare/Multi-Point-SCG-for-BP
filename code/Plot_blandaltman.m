warning off 
close all
clear 
clc

legendsize = 8;
fontsize = 10;
pointsize = 25;

figure
load('./results/ANN-SBP-PPG.mat')
SBP_Pred = test;
SBP_gt = gt;
load('./results/ANN-DBP-PPG.mat')
DBP_Pred = test;
DBP_gt = gt;
load('./results/ANN-MBP-PPG.mat')
MBP_Pred = test;
MBP_gt = gt;


subplot(2,3,1)
rr_cha = DBP_gt - DBP_Pred;
ave = (DBP_gt + DBP_Pred)*0.5;
rmse_s = rms(rr_cha);
mean_cha = mean(rr_cha);
std_cha = std(rr_cha);
shang = mean_cha+1.96*std_cha;
xia = mean_cha-1.96*std_cha;
disp(['DBP:','MD:',num2str(mean_cha),' STD:',num2str(std_cha),' S:',num2str(shang),' X:',num2str(xia)])
rr_cha_s = SBP_gt - SBP_Pred;
ave_s = (SBP_gt + SBP_Pred)*0.5;
rmse_s_s = rms(rr_cha_s);
mean_cha_s = mean(rr_cha_s);
std_cha_s = std(rr_cha_s);
shang_s = mean_cha_s+1.96*std_cha_s;
xia_s = mean_cha_s-1.96*std_cha_s;
disp(['SBP:','MD:',num2str(mean_cha_s),' STD:',num2str(std_cha_s),' S:',num2str(shang_s),' X:',num2str(xia_s)])
rr_cha_m = MBP_gt - MBP_Pred;
ave_m = (MBP_gt + MBP_Pred)*0.5;
rmse_s_m = rms(rr_cha_m);
mean_cha_m = mean(rr_cha_m);
std_cha_m = std(rr_cha_m);
shang_m = mean_cha_m+1.96*std_cha_m;
xia_m = mean_cha_m-1.96*std_cha_m;
disp(['MBP:','MD:',num2str(mean_cha_m),' STD:',num2str(std_cha_m),' S:',num2str(shang_m),' X:',num2str(xia_m)])

t = 1:length(rr_cha);
scatter(ave_s,rr_cha_s,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(ave_m,rr_cha,pointsize,[1 0.89 0.88],"filled");hold on
scatter(ave,rr_cha,pointsize,[0.5 1 0.83],"filled");hold on

plot([40,85],[mean_cha,mean_cha],'color',[0.0 0.8 0.0],'LineStyle','--','LineWidth',1);hold on
plot([40,85],[shang,shang],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on
plot([40,85],[xia,xia],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on

plot([50,110],[mean_cha_m,mean_cha_m],'color','r','LineStyle','--','LineWidth',1);hold on 
plot([50,110],[shang_m,shang_m],'color','r','LineStyle','-','LineWidth',1);hold on
plot([50,110],[xia_m,xia_m],'color','r','LineStyle','-','LineWidth',1);hold on

plot([95,160],[mean_cha_s,mean_cha_s],'color','b','LineStyle','--','LineWidth',1);hold on
plot([95,160],[shang_s,shang_s],'color','b','LineStyle','-','LineWidth',1);hold on
plot([95,160],[xia_s,xia_s],'color','b','LineStyle','-','LineWidth',1);
xlabel('(Ground truth + Estimation )/2 (mmHg)');
ylabel('Estimation Error (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
legend('SBP','DBP','MBP','FontSize',legendsize)
axis([25 165 -40 50]);  


load('./results/ANN-SBP-SCG.mat')
SBP_Pred = test;
SBP_gt = gt;
load('./results/ANN-DBP-SCG.mat')
DBP_Pred = test;
DBP_gt = gt;
load('./results/ANN-MBP-SCG.mat')
MBP_Pred = test;
MBP_gt = gt;

subplot(2,3,4)
rr_cha = DBP_gt - DBP_Pred;
ave = (DBP_gt + DBP_Pred)*0.5;
rmse_s = rms(rr_cha);
mean_cha = mean(rr_cha);
std_cha = std(rr_cha);
shang = mean_cha+1.96*std_cha;
xia = mean_cha-1.96*std_cha;
disp(['DBP:','MD:',num2str(mean_cha),' STD:',num2str(std_cha),' S:',num2str(shang),' X:',num2str(xia)])
rr_cha_s = SBP_gt - SBP_Pred;
ave_s = (SBP_gt + SBP_Pred)*0.5;
rmse_s_s = rms(rr_cha_s);
mean_cha_s = mean(rr_cha_s);
std_cha_s = std(rr_cha_s);
shang_s = mean_cha_s+1.96*std_cha_s;
xia_s = mean_cha_s-1.96*std_cha_s;
disp(['SBP:','MD:',num2str(mean_cha_s),' STD:',num2str(std_cha_s),' S:',num2str(shang_s),' X:',num2str(xia_s)])
rr_cha_m = MBP_gt - MBP_Pred;
ave_m = (MBP_gt + MBP_Pred)*0.5;
rmse_s_m = rms(rr_cha_m);
mean_cha_m = mean(rr_cha_m);
std_cha_m = std(rr_cha_m);
shang_m = mean_cha_m+1.96*std_cha_m;
xia_m = mean_cha_m-1.96*std_cha_m;
disp(['MBP:','MD:',num2str(mean_cha_m),' STD:',num2str(std_cha_m),' S:',num2str(shang_m),' X:',num2str(xia_m)])

t = 1:length(rr_cha);
scatter(ave_s,rr_cha_s,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(ave_m,rr_cha,pointsize,[1 0.89 0.88],"filled");hold on
scatter(ave,rr_cha,pointsize,[0.5 1 0.83],"filled");hold on

plot([40,85],[mean_cha,mean_cha],'color',[0.0 0.8 0.0],'LineStyle','--','LineWidth',1);hold on
plot([40,85],[shang,shang],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on
plot([40,85],[xia,xia],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on

plot([50,110],[mean_cha_m,mean_cha_m],'color','r','LineStyle','--','LineWidth',1);hold on
plot([50,110],[shang_m,shang_m],'color','r','LineStyle','-','LineWidth',1);hold on
plot([50,110],[xia_m,xia_m],'color','r','LineStyle','-','LineWidth',1);hold on

plot([95,160],[mean_cha_s,mean_cha_s],'color','b','LineStyle','--','LineWidth',1);hold on
plot([95,160],[shang_s,shang_s],'color','b','LineStyle','-','LineWidth',1);hold on
plot([95,160],[xia_s,xia_s],'color','b','LineStyle','-','LineWidth',1);
xlabel('(Ground truth + Estimation )/2 (mmHg)');
ylabel('Estimation Error (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
legend('SBP','DBP','MBP','FontSize',legendsize)
axis([25 165 -40 50]);  
 
load('./results/SVR-SBP-PPG.mat')
SBP_Pred = test;
SBP_gt = gt;
load('./results/SVR-DBP-PPG.mat')
DBP_Pred = test;
DBP_gt = gt;
load('./results/SVR-MBP-PPG.mat')
MBP_Pred = test;
MBP_gt = gt;

subplot(2,3,2)
rr_cha = DBP_gt - DBP_Pred;
ave = (DBP_gt + DBP_Pred)*0.5;
rmse_s = rms(rr_cha);
mean_cha = mean(rr_cha);
std_cha = std(rr_cha);
shang = mean_cha+1.96*std_cha;
xia = mean_cha-1.96*std_cha;
disp(['DBP:','MD:',num2str(mean_cha),' STD:',num2str(std_cha),' S:',num2str(shang),' X:',num2str(xia)])
rr_cha_s = SBP_gt - SBP_Pred;
ave_s = (SBP_gt + SBP_Pred)*0.5;
rmse_s_s = rms(rr_cha_s);
mean_cha_s = mean(rr_cha_s);
std_cha_s = std(rr_cha_s);
shang_s = mean_cha_s+1.96*std_cha_s;
xia_s = mean_cha_s-1.96*std_cha_s;
disp(['SBP:','MD:',num2str(mean_cha_s),' STD:',num2str(std_cha_s),' S:',num2str(shang_s),' X:',num2str(xia_s)])
rr_cha_m = MBP_gt - MBP_Pred;
ave_m = (MBP_gt + MBP_Pred)*0.5;
rmse_s_m = rms(rr_cha_m);
mean_cha_m = mean(rr_cha_m);
std_cha_m = std(rr_cha_m);
shang_m = mean_cha_m+1.96*std_cha_m;
xia_m = mean_cha_m-1.96*std_cha_m;
disp(['MBP:','MD:',num2str(mean_cha_m),' STD:',num2str(std_cha_m),' S:',num2str(shang_m),' X:',num2str(xia_m)])

t = 1:length(rr_cha);
scatter(ave_s,rr_cha_s,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(ave_m,rr_cha,pointsize,[1 0.89 0.88],"filled");hold on
scatter(ave,rr_cha,pointsize,[0.5 1 0.83],"filled");hold on

plot([40,85],[mean_cha,mean_cha],'color',[0.0 0.8 0.0],'LineStyle','--','LineWidth',1);hold on
 
plot([40,85],[shang,shang],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on
plot([40,85],[xia,xia],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on

plot([50,110],[mean_cha_m,mean_cha_m],'color','r','LineStyle','--','LineWidth',1);hold on
 
plot([50,110],[shang_m,shang_m],'color','r','LineStyle','-','LineWidth',1);hold on
plot([50,110],[xia_m,xia_m],'color','r','LineStyle','-','LineWidth',1);hold on

plot([95,160],[mean_cha_s,mean_cha_s],'color','b','LineStyle','--','LineWidth',1);hold on
 
plot([95,160],[shang_s,shang_s],'color','b','LineStyle','-','LineWidth',1);hold on
plot([95,160],[xia_s,xia_s],'color','b','LineStyle','-','LineWidth',1);
xlabel('(Ground truth + Estimation )/2 (mmHg)');
ylabel('Estimation Error (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
legend('SBP','DBP','MBP','FontSize',legendsize)
axis([25 165 -40 50]);  


load('./results/SVR-SBP-SCG.mat')
SBP_Pred = test;
SBP_gt = gt;
load('./results/SVR-DBP-SCG.mat')
DBP_Pred = test;
DBP_gt = gt;
load('./results/SVR-MBP-SCG.mat')
MBP_Pred = test;
MBP_gt = gt;

subplot(2,3,5)
rr_cha = DBP_gt - DBP_Pred;
ave = (DBP_gt + DBP_Pred)*0.5;
rmse_s = rms(rr_cha);
mean_cha = mean(rr_cha);
std_cha = std(rr_cha);
shang = mean_cha+1.96*std_cha;
xia = mean_cha-1.96*std_cha;
disp(['DBP:','MD:',num2str(mean_cha),' STD:',num2str(std_cha),' S:',num2str(shang),' X:',num2str(xia)])
rr_cha_s = SBP_gt - SBP_Pred;
ave_s = (SBP_gt + SBP_Pred)*0.5;
rmse_s_s = rms(rr_cha_s);
mean_cha_s = mean(rr_cha_s);
std_cha_s = std(rr_cha_s);
shang_s = mean_cha_s+1.96*std_cha_s;
xia_s = mean_cha_s-1.96*std_cha_s;
disp(['SBP:','MD:',num2str(mean_cha_s),' STD:',num2str(std_cha_s),' S:',num2str(shang_s),' X:',num2str(xia_s)])
rr_cha_m = MBP_gt - MBP_Pred;
ave_m = (MBP_gt + MBP_Pred)*0.5;
rmse_s_m = rms(rr_cha_m);
mean_cha_m = mean(rr_cha_m);
std_cha_m = std(rr_cha_m);
shang_m = mean_cha_m+1.96*std_cha_m;
xia_m = mean_cha_m-1.96*std_cha_m;
disp(['MBP:','MD:',num2str(mean_cha_m),' STD:',num2str(std_cha_m),' S:',num2str(shang_m),' X:',num2str(xia_m)])

t = 1:length(rr_cha);
scatter(ave_s,rr_cha_s,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(ave_m,rr_cha,pointsize,[1 0.89 0.88],"filled");hold on
scatter(ave,rr_cha,pointsize,[0.5 1 0.83],"filled");hold on

plot([40,85],[mean_cha,mean_cha],'color',[0.0 0.8 0.0],'LineStyle','--','LineWidth',1);hold on
plot([40,85],[shang,shang],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on
plot([40,85],[xia,xia],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on

plot([50,110],[mean_cha_m,mean_cha_m],'color','r','LineStyle','--','LineWidth',1);hold on
plot([50,110],[shang_m,shang_m],'color','r','LineStyle','-','LineWidth',1);hold on
plot([50,110],[xia_m,xia_m],'color','r','LineStyle','-','LineWidth',1);hold on

plot([95,160],[mean_cha_s,mean_cha_s],'color','b','LineStyle','--','LineWidth',1);hold on
plot([95,160],[shang_s,shang_s],'color','b','LineStyle','-','LineWidth',1);hold on
plot([95,160],[xia_s,xia_s],'color','b','LineStyle','-','LineWidth',1);
xlabel('(Ground truth + Estimation )/2 (mmHg)');
ylabel('Estimation Error (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
legend('SBP','DBP','MBP','FontSize',legendsize)
axis([25 165 -40 50]);  



load('./results/RFR-SBP-PPG.mat')
SBP_Pred = test;
SBP_gt = gt;
load('./results/RFR-DBP-PPG.mat')
DBP_Pred = test;
DBP_gt = gt;
load('./results/RFR-MBP-PPG.mat')
MBP_Pred = test;
MBP_gt = gt;

subplot(2,3,3)
rr_cha = DBP_gt - DBP_Pred;
ave = (DBP_gt + DBP_Pred)*0.5;
rmse_s = rms(rr_cha);
mean_cha = mean(rr_cha);
std_cha = std(rr_cha);
shang = mean_cha+1.96*std_cha;
xia = mean_cha-1.96*std_cha;
disp(['DBP:','MD:',num2str(mean_cha),' STD:',num2str(std_cha),' S:',num2str(shang),' X:',num2str(xia)])
rr_cha_s = SBP_gt - SBP_Pred;
ave_s = (SBP_gt + SBP_Pred)*0.5;
rmse_s_s = rms(rr_cha_s);
mean_cha_s = mean(rr_cha_s);
std_cha_s = std(rr_cha_s);
shang_s = mean_cha_s+1.96*std_cha_s;
xia_s = mean_cha_s-1.96*std_cha_s;
disp(['SBP:','MD:',num2str(mean_cha_s),' STD:',num2str(std_cha_s),' S:',num2str(shang_s),' X:',num2str(xia_s)])
rr_cha_m = MBP_gt - MBP_Pred;
ave_m = (MBP_gt + MBP_Pred)*0.5;
rmse_s_m = rms(rr_cha_m);
mean_cha_m = mean(rr_cha_m);
std_cha_m = std(rr_cha_m);
shang_m = mean_cha_m+1.96*std_cha_m;
xia_m = mean_cha_m-1.96*std_cha_m;
disp(['MBP:','MD:',num2str(mean_cha_m),' STD:',num2str(std_cha_m),' S:',num2str(shang_m),' X:',num2str(xia_m)])

t = 1:length(rr_cha);
scatter(ave_s,rr_cha_s,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(ave_m,rr_cha,pointsize,[1 0.89 0.88],"filled");hold on
scatter(ave,rr_cha,pointsize,[0.5 1 0.83],"filled");hold on

plot([40,85],[mean_cha,mean_cha],'color',[0.0 0.8 0.0],'LineStyle','--','LineWidth',1);hold on
plot([40,85],[shang,shang],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on
plot([40,85],[xia,xia],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on

plot([50,110],[mean_cha_m,mean_cha_m],'color','r','LineStyle','--','LineWidth',1);hold on
plot([50,110],[shang_m,shang_m],'color','r','LineStyle','-','LineWidth',1);hold on
plot([50,110],[xia_m,xia_m],'color','r','LineStyle','-','LineWidth',1);hold on

plot([95,160],[mean_cha_s,mean_cha_s],'color','b','LineStyle','--','LineWidth',1);hold on
plot([95,160],[shang_s,shang_s],'color','b','LineStyle','-','LineWidth',1);hold on
plot([95,160],[xia_s,xia_s],'color','b','LineStyle','-','LineWidth',1);
xlabel('(Ground truth + Estimation )/2 (mmHg)');
ylabel('Estimation Error (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
legend('SBP','DBP','MBP','FontSize',legendsize)
axis([25 165 -40 50]);  


load('./results/RFR-SBP-SCG.mat')
SBP_Pred = test;
SBP_gt = gt;
load('./results/RFR-DBP-SCG.mat')
DBP_Pred = test;
DBP_gt = gt;
load('./results/RFR-MBP-SCG.mat')
MBP_Pred = test;
MBP_gt = gt;

subplot(2,3,6)
rr_cha = DBP_gt - DBP_Pred;
ave = (DBP_gt + DBP_Pred)*0.5;
rmse_s = rms(rr_cha);
mean_cha = mean(rr_cha);
std_cha = std(rr_cha);
shang = mean_cha+1.96*std_cha;
xia = mean_cha-1.96*std_cha;
disp(['DBP:','MD:',num2str(mean_cha),' STD:',num2str(std_cha),' S:',num2str(shang),' X:',num2str(xia)])
rr_cha_s = SBP_gt - SBP_Pred;
ave_s = (SBP_gt + SBP_Pred)*0.5;
rmse_s_s = rms(rr_cha_s);
mean_cha_s = mean(rr_cha_s);
std_cha_s = std(rr_cha_s);
shang_s = mean_cha_s+1.96*std_cha_s;
xia_s = mean_cha_s-1.96*std_cha_s;
disp(['SBP:','MD:',num2str(mean_cha_s),' STD:',num2str(std_cha_s),' S:',num2str(shang_s),' X:',num2str(xia_s)])
rr_cha_m = MBP_gt - MBP_Pred;
ave_m = (MBP_gt + MBP_Pred)*0.5;
rmse_s_m = rms(rr_cha_m);
mean_cha_m = mean(rr_cha_m);
std_cha_m = std(rr_cha_m);
shang_m = mean_cha_m+1.96*std_cha_m;
xia_m = mean_cha_m-1.96*std_cha_m;
disp(['MBP:','MD:',num2str(mean_cha_m),' STD:',num2str(std_cha_m),' S:',num2str(shang_m),' X:',num2str(xia_m)])

t = 1:length(rr_cha);
scatter(ave_s,rr_cha_s,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(ave_m,rr_cha,pointsize,[1 0.89 0.88],"filled");hold on
scatter(ave,rr_cha,pointsize,[0.5 1 0.83],"filled");hold on

plot([40,85],[mean_cha,mean_cha],'color',[0.0 0.8 0.0],'LineStyle','--','LineWidth',1);hold on
plot([40,85],[shang,shang],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on
plot([40,85],[xia,xia],'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',1);hold on

plot([50,110],[mean_cha_m,mean_cha_m],'color','r','LineStyle','--','LineWidth',1);hold on
plot([50,110],[shang_m,shang_m],'color','r','LineStyle','-','LineWidth',1);hold on
plot([50,110],[xia_m,xia_m],'color','r','LineStyle','-','LineWidth',1);hold on

plot([95,160],[mean_cha_s,mean_cha_s],'color','b','LineStyle','--','LineWidth',1);hold on
plot([95,160],[shang_s,shang_s],'color','b','LineStyle','-','LineWidth',1);hold on
plot([95,160],[xia_s,xia_s],'color','b','LineStyle','-','LineWidth',1);
xlabel('(Ground truth + Estimation )/2 (mmHg)');
ylabel('Estimation Error (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
legend('SBP','DBP','MBP','FontSize',legendsize)
axis([25 165 -40 50]); 

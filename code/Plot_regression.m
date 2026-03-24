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
p1 = polyfit(DBP_gt,DBP_Pred,1);
x1 = 20:100;
y2= 20:170;
x2 = 20:170;

p2 = polyfit(SBP_gt,SBP_Pred,1);
x3 = 90:170;

p3 = polyfit(MBP_gt,MBP_Pred,1);
x4 = 50:120;

y1 = polyval(p1,x1);
y3 = polyval(p2,x3);
y4 = polyval(p3,x4);

scatter(SBP_gt,SBP_Pred,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(MBP_gt,MBP_Pred,pointsize,[1 0.89 0.88],"filled");hold on
scatter(DBP_gt,DBP_Pred,pointsize,[0.5 1 0.83],"filled");hold on

plot(x1,y1,'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',2);hold on
plot(x3,y3,'color','b','LineStyle','-','LineWidth',2);hold on
plot(x4,y4,'color','r','LineStyle','-','LineWidth',2);
 

xlabel('Ground Truth (mmHg)');
ylabel('Estimation (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
set(gca, 'XTick',20:30:170);
 
axis([15 175 15 175]);  
legend('SBP','DBP','MBP','FontSize',legendsize)
 
r_s = corr(SBP_Pred', SBP_gt');
r_d = corr(DBP_Pred', DBP_gt');
r_m = corr(MBP_Pred', MBP_gt');
 
mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
mu_x_d = mean(DBP_Pred);
mu_y_d = mean(DBP_gt);
mu_x_m = mean(MBP_Pred);
mu_y_m = mean(MBP_gt);
 
sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
sigma_x_d = std(DBP_Pred);
sigma_y_d = std(DBP_gt);
sigma_x_m = std(MBP_Pred);
sigma_y_m = std(MBP_gt);
 
ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
ccc_d = (2 * r_d * sigma_x_d * sigma_y_d) / (sigma_x_d^2 + sigma_y_d^2 + (mu_x_d - mu_y_d)^2);
ccc_m = (2 * r_m * sigma_x_m * sigma_y_m) / (sigma_x_m^2 + sigma_y_m^2 + (mu_x_m - mu_y_m)^2);

disp([num2str(r_s),':',num2str(ccc_s),'---',num2str(r_d),':',num2str(ccc_d),'---',num2str(r_m),':',num2str(ccc_m)])



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
p1 = polyfit(DBP_gt,DBP_Pred,1);
x1 = 20:100;
y2= 20:170;
x2 = 20:170;

p2 = polyfit(SBP_gt,SBP_Pred,1);
x3 = 90:170;

p3 = polyfit(MBP_gt,MBP_Pred,1);
x4 = 50:120;

y1 = polyval(p1,x1);
y3 = polyval(p2,x3);
y4 = polyval(p3,x4);

scatter(SBP_gt,SBP_Pred,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(MBP_gt,MBP_Pred,pointsize,[1 0.89 0.88],"filled");hold on
scatter(DBP_gt,DBP_Pred,pointsize,[0.5 1 0.83],"filled");hold on

plot(x1,y1,'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',2);hold on
plot(x3,y3,'color','b','LineStyle','-','LineWidth',2);hold on
plot(x4,y4,'color','r','LineStyle','-','LineWidth',2);
 

xlabel('Ground Truth (mmHg)');
ylabel('Estimation (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
set(gca, 'XTick',20:30:170);
 
axis([15 175 15 175]); 
legend('SBP','DBP','MBP','FontSize',legendsize)

 
r_s = corr(SBP_Pred', SBP_gt');
r_d = corr(DBP_Pred', DBP_gt');
r_m = corr(MBP_Pred', MBP_gt');
 
mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
mu_x_d = mean(DBP_Pred);
mu_y_d = mean(DBP_gt);
mu_x_m = mean(MBP_Pred);
mu_y_m = mean(MBP_gt);
 
sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
sigma_x_d = std(DBP_Pred);
sigma_y_d = std(DBP_gt);
sigma_x_m = std(MBP_Pred);
sigma_y_m = std(MBP_gt);
 
ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
ccc_d = (2 * r_d * sigma_x_d * sigma_y_d) / (sigma_x_d^2 + sigma_y_d^2 + (mu_x_d - mu_y_d)^2);
ccc_m = (2 * r_m * sigma_x_m * sigma_y_m) / (sigma_x_m^2 + sigma_y_m^2 + (mu_x_m - mu_y_m)^2);

disp([num2str(r_s),':',num2str(ccc_s),'---',num2str(r_d),':',num2str(ccc_d),...
    '---',num2str(r_m),':',num2str(ccc_m)])

 
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
p1 = polyfit(DBP_gt,DBP_Pred,1);
x1 = 20:100;
y2= 20:170;
x2 = 20:170;

p2 = polyfit(SBP_gt,SBP_Pred,1);
x3 = 90:170;

p3 = polyfit(MBP_gt,MBP_Pred,1);
x4 = 50:120;

y1 = polyval(p1,x1);
y3 = polyval(p2,x3);
y4 = polyval(p3,x4);

scatter(SBP_gt,SBP_Pred,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(MBP_gt,MBP_Pred,pointsize,[1 0.89 0.88],"filled");hold on
scatter(DBP_gt,DBP_Pred,pointsize,[0.5 1 0.83],"filled");hold on

plot(x1,y1,'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',2);hold on
plot(x3,y3,'color','b','LineStyle','-','LineWidth',2);hold on
plot(x4,y4,'color','r','LineStyle','-','LineWidth',2);
 

xlabel('Ground Truth (mmHg)');
ylabel('Estimation (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
set(gca, 'XTick',20:30:170);
 
axis([15 175 15 175]);  
legend('SBP','DBP','MBP','FontSize',legendsize)

 
r_s = corr(SBP_Pred', SBP_gt');
r_d = corr(DBP_Pred', DBP_gt');
r_m = corr(MBP_Pred', MBP_gt');
 
mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
mu_x_d = mean(DBP_Pred);
mu_y_d = mean(DBP_gt);
mu_x_m = mean(MBP_Pred);
mu_y_m = mean(MBP_gt);
 
sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
sigma_x_d = std(DBP_Pred);
sigma_y_d = std(DBP_gt);
sigma_x_m = std(MBP_Pred);
sigma_y_m = std(MBP_gt);
 
ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
ccc_d = (2 * r_d * sigma_x_d * sigma_y_d) / (sigma_x_d^2 + sigma_y_d^2 + (mu_x_d - mu_y_d)^2);
ccc_m = (2 * r_m * sigma_x_m * sigma_y_m) / (sigma_x_m^2 + sigma_y_m^2 + (mu_x_m - mu_y_m)^2);

disp([num2str(r_s),':',num2str(ccc_s),'---',num2str(r_d),':',num2str(ccc_d),'---',num2str(r_m),':',num2str(ccc_m)])

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
p1 = polyfit(DBP_gt,DBP_Pred,1);
x1 = 20:100;
y2= 20:170;
x2 = 20:170;

p2 = polyfit(SBP_gt,SBP_Pred,1);
x3 = 90:170;

p3 = polyfit(MBP_gt,MBP_Pred,1);
x4 = 50:120;

y1 = polyval(p1,x1);
y3 = polyval(p2,x3);
y4 = polyval(p3,x4);

scatter(SBP_gt,SBP_Pred,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(MBP_gt,MBP_Pred,pointsize,[1 0.89 0.88],"filled");hold on
scatter(DBP_gt,DBP_Pred,pointsize,[0.5 1 0.83],"filled");hold on

plot(x1,y1,'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',2);hold on
plot(x3,y3,'color','b','LineStyle','-','LineWidth',2);hold on
plot(x4,y4,'color','r','LineStyle','-','LineWidth',2);
 

xlabel('Ground Truth (mmHg)');
ylabel('Estimation (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
set(gca, 'XTick',20:30:170);
 
axis([15 175 15 175]);  
legend('SBP','DBP','MBP','FontSize',legendsize)

 
r_s = corr(SBP_Pred', SBP_gt');
r_d = corr(DBP_Pred', DBP_gt');
r_m = corr(MBP_Pred', MBP_gt');
 
mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
mu_x_d = mean(DBP_Pred);
mu_y_d = mean(DBP_gt);
mu_x_m = mean(MBP_Pred);
mu_y_m = mean(MBP_gt);
 
sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
sigma_x_d = std(DBP_Pred);
sigma_y_d = std(DBP_gt);
sigma_x_m = std(MBP_Pred);
sigma_y_m = std(MBP_gt);
 
ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
ccc_d = (2 * r_d * sigma_x_d * sigma_y_d) / (sigma_x_d^2 + sigma_y_d^2 + (mu_x_d - mu_y_d)^2);
ccc_m = (2 * r_m * sigma_x_m * sigma_y_m) / (sigma_x_m^2 + sigma_y_m^2 + (mu_x_m - mu_y_m)^2);

disp([num2str(r_s),':',num2str(ccc_s),'---',num2str(r_d),':',num2str(ccc_d),'---',num2str(r_m),':',num2str(ccc_m)])

 
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
p1 = polyfit(DBP_gt,DBP_Pred,1);
x1 = 20:100;
y2= 20:170;
x2 = 20:170;

p2 = polyfit(SBP_gt,SBP_Pred,1);
x3 = 90:170;

p3 = polyfit(MBP_gt,MBP_Pred,1);
x4 = 50:120;

y1 = polyval(p1,x1);
y3 = polyval(p2,x3);
y4 = polyval(p3,x4);

scatter(SBP_gt,SBP_Pred,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(MBP_gt,MBP_Pred,pointsize,[1 0.89 0.88],"filled");hold on
scatter(DBP_gt,DBP_Pred,pointsize,[0.5 1 0.83],"filled");hold on

plot(x1,y1,'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',2);hold on
plot(x3,y3,'color','b','LineStyle','-','LineWidth',2);hold on
plot(x4,y4,'color','r','LineStyle','-','LineWidth',2);
 

xlabel('Ground Truth (mmHg)');
ylabel('Estimation (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
set(gca, 'XTick',20:30:170);
 
axis([15 175 15 175]);  
legend('SBP','DBP','MBP','FontSize',legendsize)

 
r_s = corr(SBP_Pred', SBP_gt');
r_d = corr(DBP_Pred', DBP_gt');
r_m = corr(MBP_Pred', MBP_gt');
 
mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
mu_x_d = mean(DBP_Pred);
mu_y_d = mean(DBP_gt);
mu_x_m = mean(MBP_Pred);
mu_y_m = mean(MBP_gt);
 
sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
sigma_x_d = std(DBP_Pred);
sigma_y_d = std(DBP_gt);
sigma_x_m = std(MBP_Pred);
sigma_y_m = std(MBP_gt);
 
ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
ccc_d = (2 * r_d * sigma_x_d * sigma_y_d) / (sigma_x_d^2 + sigma_y_d^2 + (mu_x_d - mu_y_d)^2);
ccc_m = (2 * r_m * sigma_x_m * sigma_y_m) / (sigma_x_m^2 + sigma_y_m^2 + (mu_x_m - mu_y_m)^2);

disp([num2str(r_s),':',num2str(ccc_s),'---',num2str(r_d),':',num2str(ccc_d),'---',num2str(r_m),':',num2str(ccc_m)])

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
p1 = polyfit(DBP_gt,DBP_Pred,1);
x1 = 20:100;
y2= 20:170;
x2 = 20:170;

p2 = polyfit(SBP_gt,SBP_Pred,1);
x3 = 90:170;

p3 = polyfit(MBP_gt,MBP_Pred,1);
x4 = 50:120;

y1 = polyval(p1,x1);
y3 = polyval(p2,x3);
y4 = polyval(p3,x4);

scatter(SBP_gt,SBP_Pred,pointsize,[0.53 0.8 0.92],"filled");hold on
scatter(MBP_gt,MBP_Pred,pointsize,[1 0.89 0.88],"filled");hold on
scatter(DBP_gt,DBP_Pred,pointsize,[0.5 1 0.83],"filled");hold on

plot(x1,y1,'color',[0.0 0.8 0.0],'LineStyle','-','LineWidth',2);hold on
plot(x3,y3,'color','b','LineStyle','-','LineWidth',2);hold on
plot(x4,y4,'color','r','LineStyle','-','LineWidth',2);
 

xlabel('Ground Truth (mmHg)');
ylabel('Estimation (mmHg)');
set(gca,'FontName','Times New Roman','FontSize',fontsize)
set(gca, 'XTick',20:30:170);
 
axis([15 175 15 175]);  
legend('SBP','DBP','MBP','FontSize',legendsize)

 
r_s = corr(SBP_Pred', SBP_gt');
r_d = corr(DBP_Pred', DBP_gt');
r_m = corr(MBP_Pred', MBP_gt');
 
mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
mu_x_d = mean(DBP_Pred);
mu_y_d = mean(DBP_gt);
mu_x_m = mean(MBP_Pred);
mu_y_m = mean(MBP_gt);
 
sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
sigma_x_d = std(DBP_Pred);
sigma_y_d = std(DBP_gt);
sigma_x_m = std(MBP_Pred);
sigma_y_m = std(MBP_gt);
 
ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
ccc_d = (2 * r_d * sigma_x_d * sigma_y_d) / (sigma_x_d^2 + sigma_y_d^2 + (mu_x_d - mu_y_d)^2);
ccc_m = (2 * r_m * sigma_x_m * sigma_y_m) / (sigma_x_m^2 + sigma_y_m^2 + (mu_x_m - mu_y_m)^2);

disp([num2str(r_s),':',num2str(ccc_s),'---',num2str(r_d),':',num2str(ccc_d),'---',num2str(r_m),':',num2str(ccc_m)])


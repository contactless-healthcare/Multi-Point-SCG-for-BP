close all; clear; clc;

ALL_PRED = [];
ALL_TRUTH = [];

for peo = 1
min_mae = 100000;
echo = 0;
for jj =1:1:200
 
people = 0.66;


ty = "PPG";
stand = 'nostand';
paramater = 'MBP';
features = 'top8_feature';

if ty == "SCG"
    feature_num  = 1;
elseif ty == "PPG"
    feature_num  = 2;
end
[train_data,test_data,train_gt,test_gt] = DATA_SEGMEN(peo, people,ty,stand);
 

if paramater == 'SBP'
    test_gt = test_gt(:,1);
    train_gt = train_gt(:,1);
elseif paramater == 'DBP'
    test_gt = test_gt(:,2);
    train_gt = train_gt(:,2);
elseif paramater == 'MBP'
    test_gt = test_gt(:,3);
    train_gt = train_gt(:,3);
end

 

%train_data = [train_data(:,1:2) train_data(:,4:5) train_data(:,8:end)];
%train_data = [train_data(:,1:6)  train_data(:,27) train_data(:,30)];% SCG-SBP
%train_data = [train_data(:,1:6) train_data(:,28)  train_data(:,32)];% PPG-SBP
%train_data = [train_data(:,1) train_data(:,30) train_data(:,2) train_data(:,5) train_data(:,7:8) train_data(:,28)  train_data(:,15)]; % PPG-DBP
%train_data = [ train_data(:,1:2)  train_data(:,4:7) train_data(:,14) train_data(:,17)]; % SCG-DBP
train_data = [train_data(:,1:2) train_data(:,29:31) train_data(:,5) train_data(:,6)   train_data(:,40)];% PPG-MBP
%train_data = [train_data(:,13) train_data(:,29) train_data(:,1:6)   ];% SCG-MBP
%train_data = [train_data(:,3:end) ];

%test_data = [test_data(:,3:end) ];
%test_data = [test_data(:,13) test_data(:,29) test_data(:,1:6)   ];% SCG-MBP
test_data = [test_data(:,1:2) test_data(:,29:31)  test_data(:,5) test_data(:,6)   test_data(:,40)];% PPG-MBP
%test_data = [test_data(:,1:2)  test_data(:,4:7) test_data(:,14) test_data(:,17)];% SCG-DBP
%test_data = [test_data(:,1) test_data(:,30) test_data(:,2) test_data(:,5) test_data(:,7:8) test_data(:,28)  test_data(:,15)];% PPG-DBP
%test_data = [test_data(:,1:6) test_data(:,28)   test_data(:,32) ];% PPG-SBP
%test_data = [test_data(:,1:6) test_data(:,27) test_data(:,30)];% SCG-SBP
%test_data = [test_data(:,1:2) test_data(:,4:5) test_data(:,8:end)];

 %% ANN
hiddenLayerSize = 6;
 
net = feedforwardnet(hiddenLayerSize, 'trainrp');
 
gt = test_gt;


 


net = train(net, train_data(:,1:end)', train_gt');
% view(net);
y_pred_test = net(test_data(:,1:end)');

y_pred_test = y_pred_test';
pred = y_pred_test;
 

MAE = mean(abs(test_gt - pred));


mse = mean((test_gt - pred).^2);


RMSE = sqrt(mse);

ME = mean(test_gt - pred);
STD = std(test_gt - pred);

r = corr(test_gt, pred, 'type', 'Pearson');


ALL_PRED = [ALL_PRED pred'];
ALL_TRUTH = [ALL_TRUTH test_gt'];
 
WU = sum(abs(test_gt - pred)<5)/(length(test_gt));
SHI = sum(abs(test_gt - pred)<10)/(length(test_gt));
SHIWU = sum(abs(test_gt - pred)<15)/(length(test_gt));

%disp(['<5:', num2str(WU),' <10:', num2str(SHI),' <15:', num2str(SHIWU)]);
% disp([' MAE:', num2str(MAE),' RMSE:', num2str(RMSE),' r:', num2str(rr),' ME:', num2str(ME),' STD:', num2str(STD)]);


SBP_Pred = ALL_PRED;
SBP_gt = ALL_TRUTH;
fontsize = 8;
legendsize = 12;

r_s = corr(SBP_Pred', SBP_gt');

mu_x_s = mean(SBP_Pred);
mu_y_s = mean(SBP_gt);
 

sigma_x_s = std(SBP_Pred);
sigma_y_s = std(SBP_gt);
 

ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);
disp([num2str(r_s),':',num2str(ccc_s)])

CCC = ccc_s;
name = strcat('ANN','-',ty,'-',paramater,'-',features,'-',num2str(peo));
 if MAE<min_mae
      min_mae = MAE;
      echo = jj;
      save(strcat(name,'.mat'),'hiddenLayerSize',"pred","net","test_gt","train_gt","train_data",...
      "test_data","MAE","RMSE","r","STD","ME","CCC","WU","SHI","SHIWU")
 end
 disp(['peo:',num2str(peo),' Echo:', num2str(jj), ' MAE:', num2str(MAE), ' Best:',num2str(min_mae), ' Best echo:', num2str(echo)])
 

end
end
 





































































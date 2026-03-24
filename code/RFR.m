close all; clear; clc;

ALL_PRED = [];
ALL_TRUTH = [];
ImportanceImp = 0;

 
for fea = 2
for type = 2
for para = 2

for peo = 1
    min_mae = 100000;
    echo = 0;
    for jj =1:1:200

        people = 0.66;

        if type == 1
            ty = 'SCG';
        elseif type ==2
            ty = 'PPG';
        end

        stand = 'nostand'; 
        if para == 1
            paramater = 'SBP';
        elseif para ==2
            paramater = 'DBP';
        elseif para ==3
            paramater = 'MBP';
        end
        
        if fea ==1
            features = 'signal_feature';
        elseif fea ==2
            features = 'all_feature';
        elseif fea ==3
            features = 'top8_feature';
        elseif fea ==4
            features = 'except_feature';
        end
 

        [train_data,test_data,train_gt,test_gt] = DATA_SEGMEN(peo, people,ty,stand);

        if paramater == 'SBP'
            test_gt = test_gt(:,1);
            train_gt = train_gt(:,1);
            num_trees = 12;  % 决策树数量
            max_num_splits = 8;  % 每棵树的最大分裂次数
        elseif paramater == 'DBP'
            test_gt = test_gt(:,2);
            train_gt = train_gt(:,2);
            num_trees = 8;  % 决策树数量
            max_num_splits = 4;  % 每棵树的最大分裂次数
        elseif paramater == 'MBP'
            test_gt = test_gt(:,3);
            train_gt = train_gt(:,3);
            num_trees = 8;  % 决策树数量
            max_num_splits = 4;  % 每棵树的最大分裂次数
        end

        if (type==1)&(fea==1)  % signal-SCG
            train_data = [train_data(:,3) ];
            test_data = [test_data(:,3) ];
        elseif (type==2)&(fea==1) % signal-PPG
            train_data = [train_data(:,1:2) ];
            test_data = [test_data(:,1:2) ];
        elseif (fea==2)  % all
            train_data = [train_data(:,1:end) ];
            test_data = [test_data(:,1:end) ];

        elseif (fea==3)&(type==1)&(fea==1)%TOP8-SCG-SBP
            train_data = [train_data(:,1:6)  train_data(:,27) train_data(:,30)];% SCG-SBP
            test_data = [test_data(:,1:6) test_data(:,27) test_data(:,30)];% SCG-SBP
        elseif (fea==3)&(type==1)&(fea==2)%TOP8-SCG-DBP
            train_data = [ train_data(:,1:2)  train_data(:,4:7) train_data(:,14) train_data(:,17)]; % SCG-DBP
            test_data = [test_data(:,1:2)  test_data(:,4:7) test_data(:,14) test_data(:,17)];% SCG-DBP
        elseif (fea==3)&(type==1)&(fea==3)%TOP8-SCG-MBP
            train_data = [train_data(:,13) train_data(:,29) train_data(:,1:6)   ];% SCG-MBP
            test_data = [test_data(:,13) test_data(:,29) test_data(:,1:6)   ];% SCG-MBP

        elseif (fea==3)&(type==2)&(fea==1)%TOP8-PPG-SBP
            train_data = [train_data(:,1:6) train_data(:,28)  train_data(:,32)];% PPG-SBP
            test_data = [test_data(:,1:6) test_data(:,28)   test_data(:,32) ];% PPG-SBP
        elseif (fea==3)&(type==2)&(fea==2)%TOP8-PPG-DBP
            train_data = [train_data(:,1) train_data(:,30) train_data(:,2) train_data(:,5) train_data(:,7:8) train_data(:,28)  train_data(:,15)]; % PPG-DBP
            test_data = [test_data(:,1) test_data(:,30) test_data(:,2) test_data(:,5) test_data(:,7:8) test_data(:,28)  test_data(:,15)];% PPG-DBP
        elseif (fea==3)&(type==2)&(fea==3)%TOP8-PPG-MBP
            train_data = [train_data(:,1:2) train_data(:,29:31) train_data(:,5) train_data(:,6)   train_data(:,40)];% PPG-MBP
            test_data = [test_data(:,1:2) test_data(:,29:31)  test_data(:,5) test_data(:,6)   test_data(:,40)];% PPG-MBP
        
        elseif (fea==4)&(type==1)%except-SCG
            train_data = [train_data(:,1:2) train_data(:,4:5) train_data(:,8:end)];
            test_data = [test_data(:,1:2) test_data(:,4:5) test_data(:,8:end)];
        elseif (fea==4)&(type==2)%except-PPG
            train_data = [train_data(:,3:end) ];
            test_data = [test_data(:,3:end) ];    
        end

        %train_data = [train_data(:,1:2) train_data(:,4:5) train_data(:,8:end)];
        %train_data = [train_data(:,1:6)  train_data(:,27) train_data(:,30)];% SCG-SBP
        %train_data = [train_data(:,1:6) train_data(:,28)  train_data(:,32)];% PPG-SBP
        %train_data = [train_data(:,1) train_data(:,30) train_data(:,2) train_data(:,5) train_data(:,7:8) train_data(:,28)  train_data(:,15)]; % PPG-DBP
        %train_data = [ train_data(:,1:2)  train_data(:,4:7) train_data(:,14) train_data(:,17)]; % SCG-DBP
        %train_data = [train_data(:,1:2) train_data(:,29:31) train_data(:,5) train_data(:,6)   train_data(:,40)];% PPG-MBP
        %train_data = [train_data(:,13) train_data(:,29) train_data(:,1:6)   ];% SCG-MBP
        
        %test_data = [test_data(:,13) test_data(:,29) test_data(:,1:6)   ];% SCG-MBP
        %test_data = [test_data(:,1:2) test_data(:,29:31)  test_data(:,5) test_data(:,6)   test_data(:,40)];% PPG-MBP
        %test_data = [test_data(:,1:2)  test_data(:,4:7) test_data(:,14) test_data(:,17)];% SCG-DBP
        %test_data = [test_data(:,1) test_data(:,30) test_data(:,2) test_data(:,5) test_data(:,7:8) test_data(:,28)  test_data(:,15)];% PPG-DBP
        %test_data = [test_data(:,1:6) test_data(:,28)   test_data(:,32) ];% PPG-SBP
        %test_data = [test_data(:,1:6) test_data(:,27) test_data(:,30)];% SCG-SBP
        %test_data = [test_data(:,1:2) test_data(:,4:5) test_data(:,8:end)];

        %% RF模型创建/训练

        rf_model = TreeBagger(num_trees, double(train_data(:,1:end)), double(train_gt(:,1)), ...
            'Method', 'regression', 'NumPredictorsToSample', 'all', 'MaxNumSplits', max_num_splits,...
            'OOBPredictorImportance','on');


        y_pred_train = predict(rf_model, double(test_data(:,1:end)));

        pred = y_pred_train;

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


        SBP_Pred = ALL_PRED;
        SBP_gt = ALL_TRUTH;

        
        r_s = corr(SBP_Pred', SBP_gt');


        mu_x_s = mean(SBP_Pred);
        mu_y_s = mean(SBP_gt);


        sigma_x_s = std(SBP_Pred);
        sigma_y_s = std(SBP_gt);

        ccc_s = (2 * r_s * sigma_x_s * sigma_y_s) / (sigma_x_s^2 + sigma_y_s^2 + (mu_x_s - mu_y_s)^2);

        CCC = ccc_s;
        name = strcat('RFR','-',ty,'-',paramater,'-',features,'-',num2str(peo));
        if MAE<min_mae
            min_mae = MAE;
            echo = jj;
            save(strcat(name,'.mat'),"pred","rf_model","test_gt","train_gt","train_data",...
                "test_data","MAE","RMSE","r","STD","ME","CCC","WU","SHI","SHIWU")
        end
        disp([features ,'-',ty ,'-',paramater,' peo:',num2str(peo),' Echo:', num2str(jj),...
            ' MAE:', num2str(MAE), ' Best:',num2str(min_mae), ' Best echo:', num2str(echo)])

    end
end

end
end
end

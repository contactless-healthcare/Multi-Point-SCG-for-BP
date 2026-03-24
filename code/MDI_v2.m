
% 特征评估

%% 清空环境变量
warning off % 关闭警告信息显示
close all % 关闭所有图形窗口
clear % 清除工作区变量
clc % 清空命令窗口

rng(1);  
load('ALL_FEATURE.mat')

 
x_PPG = cat(1, ALL_FEATURE(:,4:43));
x_SCG = [ALL_FEATURE(:,44:73) ALL_FEATURE(:,76)];
x_all = ALL_FEATURE(:,4:76) ;


 
ySBP = ALL_FEATURE(:,1);   % SBP
yDBP = ALL_FEATURE(:,2);   % DBP
yMBP = ALL_FEATURE(:,3);
 

% 
X_no = x_PPG;
X = x_PPG;
Y = ySBP;
% 
for i = 1:size(X_no,2)
    X(:,i) = standardization(X_no(:,i));
end

ens = fitensemble(X, Y, 'LSBoost', 3000, 'Tree', 'Type', 'regression');
 
featureImportance = predictorImportance(ens);
 
normalizedFeatureImportance = featureImportance / sum(featureImportance)*2;
disp(normalizedFeatureImportance);


[sortedImportance, sortedIdx] = sort(normalizedFeatureImportance, 'descend');

% topFeaturesNames = {'HR-G','HR-R','Phase','AMP-R','IBI-G','Phase front','Phase behind',...
%     'IBI-R',...
%         'SDNN-G','SDNN-R','RMSSD-G','RMSSD-R','pNN50-R',...
%         'pNN50-G','pNN20-R','pNN20-G','VLF-R','LF-R','HF-R','LF/HF-R','VLF-G','LF-G',...
%         'HF-G','LF/HF-G',...
%         'SD1-G','SD2-G','SD1/SD2-G','SD1-R','SD2-R','SD1/SD2-R',...
%          'AMP-G'};

    topFeaturesNames = {'PAT-Min','PAT-Max','pNN50-ECG','IBI-min','IBI-ECG','HR-PPG', ...
                'IBI-max','RMSSD-max','SDNN-min','SDNN-max',...
        'RMSSD-min','pNN50-max','pNN50-min','pNN20-max','pNN20-min',...
        'VLF-min','LF-min','HF-min',...
        'LF/HF-min','VLF-max','LF-max','HF-max','LF/HF-max','SD1-min',...
        'SD2-min','SD1/SD2-min',...
        'SDNN-ECG','RMSSD-ECG','pNN20-ECG','SD1-ECG','HR-ECG','SD2-ECG','SD1/SD2-ECG',...
        'VLF-ECG','LF-ECG','HF-ECG','LF/HF-ECG',...
        'SD1-max','SD2-max','S1S2-max'};

x_labels = {};
for i = 1:length(topFeaturesNames)
    x_labels(i) = topFeaturesNames(sortedIdx(i));
end

 
figure('Position',[37,576,818,294])
bar(sortedImportance,'BarWidth',0.8,'FaceColor',[0.53 0.8 0.92]);
xticks(1:numel(normalizedFeatureImportance));  
xlabel('PPG Features');
ylabel('Feature Importance (SBP)');
xticklabels(x_labels);


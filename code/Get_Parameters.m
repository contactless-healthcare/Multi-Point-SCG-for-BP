close all; clear; clc;
load("1-1.mat")

t = BP_index;
single_length = 28;



[PAT_Max_Correct,PAT_Min_Correct,PAT_Max,PAT_Min,PPG_Max_Peck_Correct,PPG_Min_Peck_Correct,PPG_Max_Peck,PPG_Min_Peck,ECG_Peck,...
    Peck_R,Peck_G,Mean_Phase,Phase,PEP_R,PEP_G,Mean_PEP_R,Mean_PEP_G,PTT_R_Max,PTT_G_Max,PTT_R_Min,PTT_G_Min,Mean_Phase_front,...
    Mean_Phase_behind,AMP_R,AMP_G,Mean_AMP_R,Mean_AMP_G,Peck_num] ...
    = calculate_PAT_PTT_Phase(ECG,PPG,Dxyr,Dxyg,t,single_length,1,0,20);



[corr_struct] = calculate_corr_regression(PAT_Max_Correct,PAT_Min_Correct,PAT_Max,PAT_Min,Mean_Phase,Mean_PEP_R,Mean_PEP_G,...
                SBP,DBP,MBP,Mean_Phase_front,Mean_Phase_behind,Mean_AMP_R,Mean_AMP_G);



save(strcat('1-1-feature','.mat'), 'PAT_Max_Correct','PAT_Min_Correct','PAT_Max','PAT_Min','PPG_Max_Peck_Correct','PPG_Min_Peck_Correct','PPG_Max_Peck','PPG_Min_Peck','ECG_Peck',...
    'Peck_R','Peck_G','Mean_Phase','Phase','PEP_R','PEP_G','Mean_PEP_R','Mean_PEP_G','PTT_R_Max','PTT_G_Max','PTT_R_Min','PTT_G_Min','SBP','DBP','MBP','corr_struct',...
    'Mean_Phase_front','Mean_Phase_behind','AMP_R','AMP_G','Mean_AMP_R','Mean_AMP_G','Peck_num');



function [corr_struct] = calculate_corr_regression(PAT_Max_Correct,PAT_Min_Correct,PAT_Max,PAT_Min,Mean_Phase,Mean_PEP_R,Mean_PEP_G,...
    SBP,DBP,MBP,Mean_Phase_front,Mean_Phase_behind,Mean_AMP_R,Mean_AMP_G)

corr_matrixS = corrcoef(Mean_Phase,Mean_PEP_R);
corr_Mean_Phase_Mean_PEP_R = corr_matrixS(1, 2);

corr_matrixS = corrcoef(Mean_Phase,Mean_PEP_G);
corr_Mean_Phase_Mean_PEP_G = corr_matrixS(1, 2);


fit = SBP;
corr_matrixS = corrcoef(fit,PAT_Max_Correct);
corr_SBP_PAT_Max_Correct = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Min_Correct);
corr_SBP_PAT_Min_Correct = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Max);
corr_SBP_PAT_max = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Min);
corr_SBP_PAT_Min = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase);
corr_SBP_Mean_Phase = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_PEP_R);
corr_SBP_Mean_PEP_R = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_PEP_G);
corr_SBP_Mean_PEP_G = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase_front);
corr_SBP_Mean_Phase_front = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase_behind);
corr_SBP_Mean_Phase_behind = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_AMP_R./Mean_AMP_G);
corr_SBP_AMP_RG = corr_matrixS(1, 2);

% corr_matrixS = corrcoef(fit,Mean_Phase_Middle);
% corr_SBP_Mean_Phase_Middle = corr_matrixS(1, 2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fit = DBP;
corr_matrixS = corrcoef(fit,PAT_Max_Correct);
corr_DBP_PAT_Max_Correct = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Min_Correct);
corr_DBP_PAT_Min_Correct = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Max);
corr_DBP_PAT_max = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Min);
corr_DBP_PAT_Min = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase);
corr_DBP_Mean_Phase = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_PEP_R);
corr_DBP_Mean_PEP_R = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_PEP_G);
corr_DBP_Mean_PEP_G = corr_matrixS(1, 2);


corr_matrixS = corrcoef(fit,Mean_Phase_front);
corr_DBP_Mean_Phase_front = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase_behind);
corr_DBP_Mean_Phase_behind = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_AMP_R./Mean_AMP_G);
corr_DBP_AMP_RG = corr_matrixS(1, 2);


 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fit = MBP;
corr_matrixS = corrcoef(fit,PAT_Max_Correct);
corr_MBP_PAT_Max_Correct = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Min_Correct);
corr_MBP_PAT_Min_Correct = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Max);
corr_MBP_PAT_max = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,PAT_Min);
corr_MBP_PAT_Min = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase);
corr_MBP_Mean_Phase = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_PEP_R);
corr_MBP_Mean_PEP_R = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_PEP_G);
corr_MBP_Mean_PEP_G = corr_matrixS(1, 2);


corr_matrixS = corrcoef(fit,Mean_Phase_front);
corr_MBP_Mean_Phase_front = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_Phase_behind);
corr_MBP_Mean_Phase_behind = corr_matrixS(1, 2);

corr_matrixS = corrcoef(fit,Mean_AMP_R./Mean_AMP_G);
corr_MBP_AMP_RG = corr_matrixS(1, 2);





corr_struct = struct('corr_MBP_PAT_Max_Correct',corr_MBP_PAT_Max_Correct,'corr_MBP_PAT_Min_Correct',corr_MBP_PAT_Min_Correct, ...
  'corr_MBP_PAT_max',corr_MBP_PAT_max,'corr_MBP_PAT_Min',corr_MBP_PAT_Min,'corr_MBP_Mean_Phase',corr_MBP_Mean_Phase,...
  'corr_MBP_Mean_PEP_R',corr_MBP_Mean_PEP_R,'corr_MBP_Mean_PEP_G',corr_MBP_Mean_PEP_G,...
  'corr_SBP_PAT_Max_Correct',corr_SBP_PAT_Max_Correct,'corr_SBP_PAT_Min_Correct',corr_SBP_PAT_Min_Correct,'corr_SBP_PAT_max',corr_SBP_PAT_max, ...
  'corr_SBP_PAT_Min',corr_SBP_PAT_Min,'corr_SBP_Mean_Phase',corr_SBP_Mean_Phase,'corr_SBP_Mean_PEP_R',corr_SBP_Mean_PEP_R, ...
  'corr_SBP_Mean_PEP_G',corr_SBP_Mean_PEP_G,...
  'corr_DBP_PAT_Max_Correct',corr_DBP_PAT_Max_Correct, ...
  'corr_DBP_PAT_Min_Correct',corr_DBP_PAT_Min_Correct, 'corr_DBP_PAT_max',corr_DBP_PAT_max,'corr_DBP_PAT_Min',corr_DBP_PAT_Min, ...
  'corr_DBP_Mean_Phase',corr_DBP_Mean_Phase,'corr_DBP_Mean_PEP_R',corr_DBP_Mean_PEP_R, ...
  'corr_DBP_Mean_PEP_G',corr_DBP_Mean_PEP_G, ...
  'corr_MBP_Mean_Phase_behind',corr_MBP_Mean_Phase_behind, ...
  'corr_MBP_Mean_Phase_front',corr_MBP_Mean_Phase_front,'corr_SBP_Mean_Phase_behind',corr_SBP_Mean_Phase_behind, ...
  'corr_SBP_Mean_Phase_front',corr_SBP_Mean_Phase_front, 'corr_DBP_Mean_Phase_behind',corr_DBP_Mean_Phase_behind, ...
  'corr_DBP_Mean_Phase_front',corr_DBP_Mean_Phase_front,'corr_Mean_Phase_Mean_PEP_R',corr_Mean_Phase_Mean_PEP_R,...
  'corr_Mean_Phase_Mean_PEP_G',corr_Mean_Phase_Mean_PEP_G,'corr_DBP_AMP_RG',corr_DBP_AMP_RG,'corr_MBP_AMP_RG',corr_MBP_AMP_RG,...
  'corr_SBP_AMP_RG',corr_SBP_AMP_RG);

end
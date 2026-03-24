function [train_data,test_data,train_gt,test_gt] = DATA_SEGMEN(peo,rat1,flag,stand)

index_test = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19];%

Mean_HR_G1 = [];Mean_HR_R1 = [];Mean_HR_PG1 = [];Mean_HR_EG1 = [];Mean_IBI_SG1 = [];Mean_IBI_SR1 = [];SDNN_SG1 = [];SDNN_SR1 = [];RMSSD_SG1 = [];
RMSSD_SR1 = [];pNN50_SR1 = [];pNN50_SG1 = [];pNN20_SR1 = [];pNN20_SG1 = [];VLF_SR1 = [];LF_SR1 = [];HF_SR1 = [];LFHFratio_SR1 = [];
VLF_SG1 = [];LF_SG1 = [];HF_SG1 = [];LFHFratio_SG1 = [];RR_SD1_SG1 =[ ];RR_SD2_SG1 =[ ];RR_S1S2_SG1 =[ ];RR_SD1_SR1 =[ ];RR_SD2_SR1 =[ ];
RR_S1S2_SR1 =[ ];Mean_IBI_PG_max1 = [];Mean_IBI_PG_min1 = [];SDNN_PG_max1 = [ ];SDNN_PG_min1= [ ];RMSSD_PG_max1 = [ ];RMSSD_PG_min1 =[];
pNN50_PG_max1=[];pNN50_PG_min1=[];pNN20_PG_max1=[];pNN20_PG_min1=[];VLF_PG_min1=[];LF_PG_min1=[];HF_PG_min1 = [];LFHFratio_PG_min1=[];
VLF_PG_max1=[];LF_PG_max1=[];HF_PG_max1=[];LFHFratio_PG_max1=[];RR_SD1_PG_min1=[];RR_SD2_PG_min1=[];RR_S1S2_PG_min1=[];
RR_SD1_PG_max1 =[];RR_SD2_PG_max1=[];RR_S1S2_PG_max1 =[];Mean_IBI_EG1 =[];SDNN_EG1 = [ ];RMSSD_EG1 = [];pNN20_EG1 = [];pNN50_EG1 = [];
RR_SD1_EG1 =[ ];RR_SD2_EG1=[ ];RR_S1S2_EG1 =[ ];VLF_EG1 = [ ];LF_EG1 = [ ];HF_EG1 = [ ];LFHFratio_EG1 = [ ];Mean_Phase_front1 = [];
Mean_Phase_behind1 = [];Mean_Phase1 = [];Mean_AMP_R1 = [];Mean_AMP_G1 = [];Mean_PEP_R1 = [];Mean_PEP_G1 = [];PAT_Max_Correct1 = [];
PAT_Min_Correct1 = [];PAT_Max1 = [];PAT_Min1 = [];SBP1 = [];DBP1 = [];MBP1 = [];
for i = 1:length(index_test)
    if stand == "standar"
        load(num2str(index_test(i)+100));
    else
        load(num2str(index_test(i)));
    end

    if peo == 1
        rat = rat1;
        
        Mean_HR_G1 = [Mean_HR_G1 Mean_HR_G(1:round(rat*end))];
        Mean_HR_R1 = [Mean_HR_R1 Mean_HR_R(1:round(rat*end))];
        Mean_HR_PG1 = [Mean_HR_PG1 Mean_HR_PG(1:round(rat*end))];
        Mean_HR_EG1 = [Mean_HR_EG1 Mean_HR_EG(1:round(rat*end))];
        Mean_IBI_SG1 = [Mean_IBI_SG1 Mean_IBI_SG(1:round(rat*end))];
        Mean_IBI_SR1 = [Mean_IBI_SR1 Mean_IBI_SR(1:round(rat*end))];
        SDNN_SG1 = [SDNN_SG1 SDNN_SG(1:round(rat*end))];              %
        SDNN_SR1 = [SDNN_SR1 SDNN_SR(1:round(rat*end))];
        RMSSD_SG1 = [RMSSD_SG1 RMSSD_SG(1:round(rat*end))];
        RMSSD_SR1 = [RMSSD_SR1 RMSSD_SR(1:round(rat*end))];
        pNN50_SR1 = [pNN50_SR1 pNN50_SR(1:round(rat*end))];
        pNN50_SG1 = [pNN50_SG1 pNN50_SG(1:round(rat*end))];
        pNN20_SR1 = [pNN20_SR1 pNN20_SR(1:round(rat*end))];
        pNN20_SG1 = [pNN20_SG1 pNN20_SG(1:round(rat*end))];
        VLF_SR1 = [VLF_SR1 VLF_SR(1:round(rat*end))];      %
        LF_SR1 = [LF_SR1 LF_SR(1:round(rat*end))];
        HF_SR1 = [HF_SR1 HF_SR(1:round(rat*end))];
        LFHFratio_SR1 = [LFHFratio_SR1 LFHFratio_SR(1:round(rat*end))];
        VLF_SG1 = [VLF_SG1 VLF_SG(1:round(rat*end))];
        LF_SG1 = [LF_SG1 LF_SG(1:round(rat*end))];
        HF_SG1 = [HF_SG1  HF_SG(1:round(rat*end))];
        LFHFratio_SG1 = [LFHFratio_SG1 LFHFratio_SG(1:round(rat*end))];
        RR_SD1_SG1 =[RR_SD1_SG1 RR_SD1_SG(1:round(rat*end)) ];
        RR_SD2_SG1 =[RR_SD2_SG1 RR_SD2_SG(1:round(rat*end)) ];%
        RR_S1S2_SG1 =[RR_S1S2_SG1 RR_S1S2_SG(1:round(rat*end)) ];
        RR_SD1_SR1 =[RR_SD1_SR1 RR_SD1_SR(1:round(rat*end)) ];
        RR_SD2_SR1 =[ RR_SD2_SR1 RR_SD2_SR(1:round(rat*end))];
        RR_S1S2_SR1 =[RR_S1S2_SR1 RR_S1S2_SR(1:round(rat*end))];
        Mean_IBI_PG_max1 = [Mean_IBI_PG_max1 Mean_IBI_PG_max(1:round(rat*end))];
        Mean_IBI_PG_min1 = [Mean_IBI_PG_min1 Mean_IBI_PG_min(1:round(rat*end))];
        SDNN_PG_max1 = [SDNN_PG_max1 SDNN_PG_max(1:round(rat*end))];
        SDNN_PG_min1= [SDNN_PG_min1 SDNN_PG_min(1:round(rat*end))];
        RMSSD_PG_max1 = [RMSSD_PG_max1 RMSSD_PG_max(1:round(rat*end))];
        RMSSD_PG_min1 = [RMSSD_PG_min1 RMSSD_PG_min(1:round(rat*end))];
        pNN50_PG_max1 = [pNN50_PG_max1 pNN50_PG_max(1:round(rat*end))];
        pNN50_PG_min1 = [pNN50_PG_min1 pNN50_PG_min(1:round(rat*end)) ];
        pNN20_PG_max1 = [pNN20_PG_max1 pNN20_PG_max(1:round(rat*end))];
        pNN20_PG_min1 = [pNN20_PG_min1 pNN20_PG_min(1:round(rat*end)) ];
        VLF_PG_min1 = [VLF_PG_min1 VLF_PG_min(1:round(rat*end)) ];
        LF_PG_min1 = [LF_PG_min1 LF_PG_min(1:round(rat*end)) ];
        HF_PG_min1 = [HF_PG_min1 HF_PG_min(1:round(rat*end)) ];
        LFHFratio_PG_min1 = [ LFHFratio_PG_min1 LFHFratio_PG_min(1:round(rat*end))];
        VLF_PG_max1 = [VLF_PG_max1 VLF_PG_max(1:round(rat*end)) ];
        LF_PG_max1 = [LF_PG_max1 LF_PG_max(1:round(rat*end)) ];
        HF_PG_max1 = [HF_PG_max1 HF_PG_max(1:round(rat*end)) ];
        LFHFratio_PG_max1 = [LFHFratio_PG_max1 LFHFratio_PG_max(1:round(rat*end))];
        RR_SD1_PG_min1 =[RR_SD1_PG_min1 RR_SD1_PG_min(1:round(rat*end)) ];
        RR_SD2_PG_min1 =[RR_SD2_PG_min1 RR_SD2_PG_min(1:round(rat*end))];
        RR_S1S2_PG_min1 =[RR_S1S2_PG_min1 RR_S1S2_PG_min(1:round(rat*end))];
        RR_SD1_PG_max1 =[RR_SD1_PG_max1 RR_SD1_PG_max(1:round(rat*end)) ];
        RR_SD2_PG_max1=[RR_SD2_PG_max1 RR_SD2_PG_max(1:round(rat*end))];
        RR_S1S2_PG_max1 =[RR_S1S2_PG_max1 RR_S1S2_PG_max(1:round(rat*end)) ];
        Mean_IBI_EG1 = [Mean_IBI_EG1 Mean_IBI_EG(1:round(rat*end))];
        SDNN_EG1 = [SDNN_EG1 SDNN_EG(1:round(rat*end)) ];
        RMSSD_EG1 = [RMSSD_EG1 RMSSD_EG(1:round(rat*end))];
        pNN20_EG1 = [pNN20_EG1 pNN20_EG(1:round(rat*end))];
        pNN50_EG1 = [pNN50_EG1 pNN50_EG(1:round(rat*end))];
        RR_SD1_EG1 =[RR_SD1_EG1 RR_SD1_EG(1:round(rat*end)) ];
        RR_SD2_EG1=[RR_SD2_EG1 RR_SD2_EG(1:round(rat*end)) ];
        RR_S1S2_EG1 =[RR_S1S2_EG1 RR_S1S2_EG(1:round(rat*end))];
        VLF_EG1 = [VLF_EG1 VLF_EG(1:round(rat*end))];
        LF_EG1 = [LF_EG1 LF_EG(1:round(rat*end))];
        HF_EG1 = [HF_EG1 HF_EG(1:round(rat*end))];
        LFHFratio_EG1 = [LFHFratio_EG1 LFHFratio_EG(1:round(rat*end))];
        Mean_Phase_front1 = [Mean_Phase_front1 Mean_Phase_front(1:round(rat*end))];
        Mean_Phase_behind1 = [Mean_Phase_behind1 Mean_Phase_behind(1:round(rat*end))];
        Mean_Phase1 = [Mean_Phase1 Mean_Phase(1:round(rat*end))];
        Mean_AMP_R1 = [Mean_AMP_R1 Mean_AMP_R(1:round(rat*end))];
        Mean_AMP_G1 = [Mean_AMP_G1 Mean_AMP_G(1:round(rat*end))];
        Mean_PEP_R1 = [Mean_PEP_R1 Mean_PEP_R(1:round(rat*end))];
        Mean_PEP_G1 = [Mean_PEP_G1 Mean_PEP_G(1:round(rat*end))];
        PAT_Max_Correct1 = [PAT_Max_Correct1 PAT_Max_Correct(1:round(rat*end))];
        PAT_Min_Correct1 = [PAT_Min_Correct1 PAT_Min_Correct(1:round(rat*end))];
        PAT_Max1 = [PAT_Max1 PAT_Max(1:round(rat*end))];%
        PAT_Min1 = [PAT_Min1 PAT_Min(1:round(rat*end))];
        SBP1 = [SBP1 SBP(1:round(rat*end))];
        DBP1 = [DBP1 DBP(1:round(rat*end))];
        MBP1 = [MBP1 MBP(1:round(rat*end))];

    elseif peo == 2
        rat = rat1;
        rat2 = 1-rat1;
        Mean_HR_G1 = [Mean_HR_G1 Mean_HR_G(1:round(rat2*end)-1) Mean_HR_G(round(rat*end)+1:end)];
        Mean_HR_R1 = [Mean_HR_R1 Mean_HR_R(1:round(rat2*end)-1) Mean_HR_R(round(rat*end)+1:end)];
        Mean_HR_PG1 = [Mean_HR_PG1 Mean_HR_PG(1:round(rat2*end)-1) Mean_HR_PG(round(rat*end)+1:end)];
        Mean_HR_EG1 = [Mean_HR_EG1 Mean_HR_EG(1:round(rat2*end)-1) Mean_HR_EG(round(rat*end)+1:end)];
        Mean_IBI_SG1 = [Mean_IBI_SG1 Mean_IBI_SG(1:round(rat2*end)-1) Mean_IBI_SG(round(rat*end)+1:end)];
        Mean_IBI_SR1 = [Mean_IBI_SR1 Mean_IBI_SR(1:round(rat2*end)-1) Mean_IBI_SR(round(rat*end)+1:end)];
        SDNN_SG1 = [SDNN_SG1 SDNN_SG(1:round(rat2*end)-1) SDNN_SG(round(rat*end)+1:end)];              %
        SDNN_SR1 = [SDNN_SR1 SDNN_SR(1:round(rat2*end)-1) SDNN_SR(round(rat*end)+1:end)];
        RMSSD_SG1 = [RMSSD_SG1 RMSSD_SG(1:round(rat2*end)-1) RMSSD_SG(round(rat*end)+1:end)];
        RMSSD_SR1 = [RMSSD_SR1 RMSSD_SR(1:round(rat2*end)-1) RMSSD_SR(round(rat*end)+1:end)];
        pNN50_SR1 = [pNN50_SR1 pNN50_SR(1:round(rat2*end)-1) pNN50_SR(round(rat*end)+1:end)];
        pNN50_SG1 = [pNN50_SG1 pNN50_SG(1:round(rat2*end)-1) pNN50_SG(round(rat*end)+1:end)];
        pNN20_SR1 = [pNN20_SR1 pNN20_SR(1:round(rat2*end)-1) pNN20_SR(round(rat*end)+1:end)];
        pNN20_SG1 = [pNN20_SG1 Mean_HR_EG(1:round(rat2*end)-1) pNN20_SG(round(rat*end)+1:end)];
        VLF_SR1 = [VLF_SR1 VLF_SR(1:round(rat2*end)-1) VLF_SR(round(rat*end)+1:end)];      %
        LF_SR1 = [LF_SR1 LF_SR(1:round(rat2*end)-1) LF_SR(round(rat*end)+1:end)];
        HF_SR1 = [HF_SR1 HF_SR(1:round(rat2*end)-1) HF_SR(round(rat*end)+1:end)];
        LFHFratio_SR1 = [LFHFratio_SR1 LFHFratio_SR(1:round(rat2*end)-1) LFHFratio_SR(round(rat*end)+1:end)];
        VLF_SG1 = [VLF_SG1 VLF_SG(1:round(rat2*end)-1) VLF_SG(round(rat*end)+1:end)];
        LF_SG1 = [LF_SG1 LF_SG(1:round(rat2*end)-1) LF_SG(round(rat*end)+1:end)];
        HF_SG1 = [HF_SG1 HF_SG(1:round(rat2*end)-1) HF_SG(round(rat*end)+1:end)];
        LFHFratio_SG1 = [LFHFratio_SG1 LFHFratio_SG(1:round(rat2*end)-1) LFHFratio_SG(round(rat*end)+1:end)];
        RR_SD1_SG1 =[RR_SD1_SG1 RR_SD1_SG(1:round(rat2*end)-1) RR_SD1_SG(round(rat*end)+1:end)];
        RR_SD2_SG1 =[RR_SD2_SG1 RR_SD2_SG(1:round(rat2*end)-1) RR_SD2_SG(round(rat*end)+1:end)];%
        RR_S1S2_SG1 =[RR_S1S2_SG1 RR_S1S2_SG(1:round(rat2*end)-1) RR_S1S2_SG(round(rat*end)+1:end)];
        RR_SD1_SR1 =[RR_SD1_SR1 RR_SD1_SR(1:round(rat2*end)-1) RR_SD1_SR(round(rat*end)+1:end)];
        RR_SD2_SR1 =[ RR_SD2_SR1 RR_SD2_SR(1:round(rat2*end)-1) RR_SD2_SR(round(rat*end)+1:end)];
        RR_S1S2_SR1 =[RR_S1S2_SR1 RR_S1S2_SR(1:round(rat2*end)-1) RR_S1S2_SR(round(rat*end)+1:end)];
        Mean_IBI_PG_max1 = [Mean_IBI_PG_max1 Mean_IBI_PG_max(1:round(rat2*end)-1) Mean_IBI_PG_max(round(rat*end)+1:end)];
        Mean_IBI_PG_min1 = [Mean_IBI_PG_min1 Mean_IBI_PG_min(1:round(rat2*end)-1) Mean_IBI_PG_min(round(rat*end)+1:end)];
        SDNN_PG_max1 = [SDNN_PG_max1 SDNN_PG_max(1:round(rat2*end)-1) SDNN_PG_max(round(rat*end)+1:end)];
        SDNN_PG_min1= [SDNN_PG_min1 SDNN_PG_min(1:round(rat2*end)-1) SDNN_PG_min(round(rat*end)+1:end)];
        RMSSD_PG_max1 = [RMSSD_PG_max1 RMSSD_PG_max(1:round(rat2*end)-1) RMSSD_PG_max(round(rat*end)+1:end)];
        RMSSD_PG_min1 = [RMSSD_PG_min1 RMSSD_PG_min(1:round(rat2*end)-1) RMSSD_PG_min(round(rat*end)+1:end)];
        pNN50_PG_max1 = [pNN50_PG_max1 pNN50_PG_max(1:round(rat2*end)-1) pNN50_PG_max(round(rat*end)+1:end)];
        pNN50_PG_min1 = [pNN50_PG_min1 pNN50_PG_min(1:round(rat2*end)-1) pNN50_PG_min(round(rat*end)+1:end)];
        pNN20_PG_max1 = [pNN20_PG_max1 pNN20_PG_max(1:round(rat2*end)-1) pNN20_PG_max(round(rat*end)+1:end)];
        pNN20_PG_min1 = [pNN20_PG_min1 pNN20_PG_min(1:round(rat2*end)-1) pNN20_PG_min(round(rat*end)+1:end)];
        VLF_PG_min1 = [VLF_PG_min1 VLF_PG_min(1:round(rat2*end)-1) VLF_PG_min(round(rat*end)+1:end)];
        LF_PG_min1 = [LF_PG_min1 LF_PG_min(1:round(rat2*end)-1) LF_PG_min(round(rat*end)+1:end)];
        HF_PG_min1 = [HF_PG_min1 HF_PG_min(1:round(rat2*end)-1) HF_PG_min(round(rat*end)+1:end)];
        LFHFratio_PG_min1 = [ LFHFratio_PG_min1 LFHFratio_PG_min(1:round(rat2*end)-1) LFHFratio_PG_min(round(rat*end)+1:end)];
        VLF_PG_max1 = [VLF_PG_max1 VLF_PG_max(1:round(rat2*end)-1) VLF_PG_max(round(rat*end)+1:end)];
        LF_PG_max1 = [LF_PG_max1 LF_PG_max(1:round(rat2*end)-1) LF_PG_max(round(rat*end)+1:end)];
        HF_PG_max1 = [HF_PG_max1 HF_PG_max(1:round(rat2*end)-1) HF_PG_max(round(rat*end)+1:end)];
        LFHFratio_PG_max1 = [LFHFratio_PG_max1 LFHFratio_PG_max(1:round(rat2*end)-1) LFHFratio_PG_max(round(rat*end)+1:end)];
        RR_SD1_PG_min1 =[RR_SD1_PG_min1 RR_SD1_PG_min(1:round(rat2*end)-1) RR_SD1_PG_min(round(rat*end)+1:end)];
        RR_SD2_PG_min1 =[RR_SD2_PG_min1 RR_SD2_PG_min(1:round(rat2*end)-1) RR_SD2_PG_min(round(rat*end)+1:end)];
        RR_S1S2_PG_min1 =[RR_S1S2_PG_min1 RR_S1S2_PG_min(1:round(rat2*end)-1) RR_S1S2_PG_min(round(rat*end)+1:end)];
        RR_SD1_PG_max1 =[RR_SD1_PG_max1 RR_SD1_PG_max(1:round(rat2*end)-1) RR_SD1_PG_max(round(rat*end)+1:end)];
        RR_SD2_PG_max1=[RR_SD2_PG_max1 RR_SD2_PG_max(1:round(rat2*end)-1) RR_SD2_PG_max(round(rat*end)+1:end)];
        RR_S1S2_PG_max1 =[RR_S1S2_PG_max1 RR_S1S2_PG_max(1:round(rat2*end)-1) RR_S1S2_PG_max(round(rat*end)+1:end)];
        Mean_IBI_EG1 = [Mean_IBI_EG1 Mean_IBI_EG(1:round(rat2*end)-1) Mean_IBI_EG(round(rat*end)+1:end)];
        SDNN_EG1 = [SDNN_EG1 SDNN_EG(1:round(rat2*end)-1) SDNN_EG(round(rat*end)+1:end)];
        RMSSD_EG1 = [RMSSD_EG1 RMSSD_EG(1:round(rat2*end)-1) RMSSD_EG(round(rat*end)+1:end)];
        pNN20_EG1 = [pNN20_EG1 pNN20_EG(1:round(rat2*end)-1) pNN20_EG(round(rat*end)+1:end)];
        pNN50_EG1 = [pNN50_EG1 pNN50_EG(1:round(rat2*end)-1) pNN50_EG(round(rat*end)+1:end)];
        RR_SD1_EG1 =[RR_SD1_EG1 RR_SD1_EG(1:round(rat2*end)-1) RR_SD1_EG(round(rat*end)+1:end) ];
        RR_SD2_EG1=[RR_SD2_EG1 RR_SD2_EG(1:round(rat2*end)-1) RR_SD2_EG(round(rat*end)+1:end)];
        RR_S1S2_EG1 =[RR_S1S2_EG1 RR_S1S2_EG(1:round(rat2*end)-1) RR_S1S2_EG(round(rat*end)+1:end)];
        VLF_EG1 = [VLF_EG1 VLF_EG(1:round(rat2*end)-1) VLF_EG(round(rat*end)+1:end)];
        LF_EG1 = [LF_EG1 LF_EG(1:round(rat2*end)-1) LF_EG(round(rat*end)+1:end)];
        HF_EG1 = [HF_EG1 HF_EG(1:round(rat2*end)-1) HF_EG(round(rat*end)+1:end)];
        LFHFratio_EG1 = [LFHFratio_EG1 LFHFratio_EG(1:round(rat2*end)-1) LFHFratio_EG(round(rat*end)+1:end)];
        Mean_Phase_front1 = [Mean_Phase_front1 Mean_Phase_front(1:round(rat2*end)-1) Mean_Phase_front(round(rat*end)+1:end)];
        Mean_Phase_behind1 = [Mean_Phase_behind1 Mean_Phase_behind(1:round(rat2*end)-1) Mean_Phase_behind(round(rat*end)+1:end)];
        Mean_Phase1 = [Mean_Phase1 Mean_Phase(1:round(rat2*end)-1) Mean_Phase(round(rat*end)+1:end)];
        Mean_AMP_R1 = [Mean_AMP_R1 Mean_AMP_R(1:round(rat2*end)-1) Mean_AMP_R(round(rat*end)+1:end)];
        Mean_AMP_G1 = [Mean_AMP_G1 Mean_AMP_G(1:round(rat2*end)-1) Mean_AMP_G(round(rat*end)+1:end)];
        Mean_PEP_R1 = [Mean_PEP_R1 Mean_PEP_R(1:round(rat2*end)-1) Mean_PEP_R(round(rat*end)+1:end)];
        Mean_PEP_G1 = [Mean_PEP_G1 Mean_PEP_G(1:round(rat2*end)-1) Mean_PEP_G(round(rat*end)+1:end)];
        PAT_Max_Correct1 = [PAT_Max_Correct1 PAT_Max_Correct(1:round(rat2*end)-1) PAT_Max_Correct(round(rat*end)+1:end)];
        PAT_Min_Correct1 = [PAT_Min_Correct1 PAT_Min_Correct(1:round(rat2*end)-1) PAT_Min_Correct(round(rat*end)+1:end)];
        PAT_Max1 = [PAT_Max1 PAT_Max(1:round(rat2*end)-1) PAT_Max(round(rat*end)+1:end)];%
        PAT_Min1 = [PAT_Min1 PAT_Min(1:round(rat2*end)-1) PAT_Min(round(rat*end)+1:end)];
        SBP1 = [SBP1 SBP(1:round(rat2*end)-1) SBP(round(rat*end)+1:end)];
        DBP1 = [DBP1 DBP(1:round(rat2*end)-1) DBP(round(rat*end)+1:end)];
        MBP1 = [MBP1 MBP(1:round(rat2*end)-1) MBP(round(rat*end)+1:end)];

    elseif peo == 3
        rat = 1-rat1;
        
        Mean_HR_G1 = [Mean_HR_G1 Mean_HR_G(round(rat*end)+1:end)];
        Mean_HR_R1 = [Mean_HR_R1 Mean_HR_R(round(rat*end)+1:end)];
        Mean_HR_PG1 = [Mean_HR_PG1 Mean_HR_PG(round(rat*end)+1:end)];
        Mean_HR_EG1 = [Mean_HR_EG1 Mean_HR_EG(round(rat*end)+1:end)];
        Mean_IBI_SG1 = [Mean_IBI_SG1 Mean_IBI_SG(round(rat*end)+1:end)];
        Mean_IBI_SR1 = [Mean_IBI_SR1 Mean_IBI_SR(round(rat*end)+1:end)];
        SDNN_SG1 = [SDNN_SG1 SDNN_SG(round(rat*end)+1:end)];              %
        SDNN_SR1 = [SDNN_SR1 SDNN_SR(round(rat*end)+1:end)];
        RMSSD_SG1 = [RMSSD_SG1 RMSSD_SG(round(rat*end)+1:end)];
        RMSSD_SR1 = [RMSSD_SR1 RMSSD_SR(round(rat*end)+1:end)];
        pNN50_SR1 = [pNN50_SR1 pNN50_SR(round(rat*end)+1:end)];
        pNN50_SG1 = [pNN50_SG1 pNN50_SG(round(rat*end)+1:end)];
        pNN20_SR1 = [pNN20_SR1 pNN20_SR(round(rat*end)+1:end)];
        pNN20_SG1 = [pNN20_SG1 pNN20_SG(round(rat*end)+1:end)];
        VLF_SR1 = [VLF_SR1 VLF_SR(round(rat*end)+1:end)];      %
        LF_SR1 = [LF_SR1 LF_SR(round(rat*end)+1:end)];
        HF_SR1 = [HF_SR1 HF_SR(round(rat*end)+1:end)];
        LFHFratio_SR1 = [LFHFratio_SR1 LFHFratio_SR(round(rat*end)+1:end)];
        VLF_SG1 = [VLF_SG1 VLF_SG(round(rat*end)+1:end)];
        LF_SG1 = [LF_SG1 LF_SG(round(rat*end)+1:end)];
        HF_SG1 = [HF_SG1  HF_SG(round(rat*end)+1:end)];
        LFHFratio_SG1 = [LFHFratio_SG1 LFHFratio_SG(round(rat*end)+1:end)];
        RR_SD1_SG1 =[RR_SD1_SG1 RR_SD1_SG(round(rat*end)+1:end)];
        RR_SD2_SG1 =[RR_SD2_SG1 RR_SD2_SG(round(rat*end)+1:end)];%
        RR_S1S2_SG1 =[RR_S1S2_SG1 RR_S1S2_SG(round(rat*end)+1:end)];
        RR_SD1_SR1 =[RR_SD1_SR1 RR_SD1_SR(round(rat*end)+1:end)];
        RR_SD2_SR1 =[ RR_SD2_SR1 RR_SD2_SR(round(rat*end)+1:end)];
        RR_S1S2_SR1 =[RR_S1S2_SR1 RR_S1S2_SR(round(rat*end)+1:end)];
        Mean_IBI_PG_max1 = [Mean_IBI_PG_max1 Mean_IBI_PG_max(round(rat*end)+1:end)];
        Mean_IBI_PG_min1 = [Mean_IBI_PG_min1 Mean_IBI_PG_min(round(rat*end)+1:end)];
        SDNN_PG_max1 = [SDNN_PG_max1 SDNN_PG_max(round(rat*end)+1:end)];
        SDNN_PG_min1= [SDNN_PG_min1 SDNN_PG_min(round(rat*end)+1:end)];
        RMSSD_PG_max1 = [RMSSD_PG_max1 RMSSD_PG_max(round(rat*end)+1:end)];
        RMSSD_PG_min1 = [RMSSD_PG_min1 RMSSD_PG_min(round(rat*end)+1:end)];
        pNN50_PG_max1 = [pNN50_PG_max1 pNN50_PG_max(round(rat*end)+1:end)];
        pNN50_PG_min1 = [pNN50_PG_min1 pNN50_PG_min(round(rat*end)+1:end)];
        pNN20_PG_max1 = [pNN20_PG_max1 pNN20_PG_max(round(rat*end)+1:end)];
        pNN20_PG_min1 = [pNN20_PG_min1 pNN20_PG_min(round(rat*end)+1:end)];
        VLF_PG_min1 = [VLF_PG_min1 VLF_PG_min(round(rat*end)+1:end)];
        LF_PG_min1 = [LF_PG_min1 LF_PG_min(round(rat*end)+1:end)];
        HF_PG_min1 = [HF_PG_min1 HF_PG_min(round(rat*end)+1:end)];
        LFHFratio_PG_min1 = [ LFHFratio_PG_min1 LFHFratio_PG_min(round(rat*end)+1:end)];
        VLF_PG_max1 = [VLF_PG_max1 VLF_PG_max(round(rat*end)+1:end)];
        LF_PG_max1 = [LF_PG_max1 LF_PG_max(round(rat*end)+1:end)];
        HF_PG_max1 = [HF_PG_max1 HF_PG_max(round(rat*end)+1:end)];
        LFHFratio_PG_max1 = [LFHFratio_PG_max1 LFHFratio_PG_max(round(rat*end)+1:end)];
        RR_SD1_PG_min1 =[RR_SD1_PG_min1 RR_SD1_PG_min(round(rat*end)+1:end)];
        RR_SD2_PG_min1 =[RR_SD2_PG_min1 RR_SD2_PG_min(round(rat*end)+1:end)];
        RR_S1S2_PG_min1 =[RR_S1S2_PG_min1 RR_S1S2_PG_min(round(rat*end)+1:end)];
        RR_SD1_PG_max1 =[RR_SD1_PG_max1 RR_SD1_PG_max(round(rat*end)+1:end)];
        RR_SD2_PG_max1=[RR_SD2_PG_max1 RR_SD2_PG_max(round(rat*end)+1:end)];
        RR_S1S2_PG_max1 =[RR_S1S2_PG_max1 RR_S1S2_PG_max(round(rat*end)+1:end)];
        Mean_IBI_EG1 = [Mean_IBI_EG1 Mean_IBI_EG(round(rat*end)+1:end)];
        SDNN_EG1 = [SDNN_EG1 SDNN_EG(round(rat*end)+1:end)];
        RMSSD_EG1 = [RMSSD_EG1 RMSSD_EG(round(rat*end)+1:end)];
        pNN20_EG1 = [pNN20_EG1 pNN20_EG(round(rat*end)+1:end)];
        pNN50_EG1 = [pNN50_EG1 pNN50_EG(round(rat*end)+1:end)];
        RR_SD1_EG1 =[RR_SD1_EG1 RR_SD1_EG(round(rat*end)+1:end) ];
        RR_SD2_EG1=[RR_SD2_EG1 RR_SD2_EG(round(rat*end)+1:end)];
        RR_S1S2_EG1 =[RR_S1S2_EG1 RR_S1S2_EG(round(rat*end)+1:end)];
        VLF_EG1 = [VLF_EG1 VLF_EG(round(rat*end)+1:end)];
        LF_EG1 = [LF_EG1 LF_EG(round(rat*end)+1:end)];
        HF_EG1 = [HF_EG1 HF_EG(round(rat*end)+1:end)];
        LFHFratio_EG1 = [LFHFratio_EG1 LFHFratio_EG(round(rat*end)+1:end)];
        Mean_Phase_front1 = [Mean_Phase_front1 Mean_Phase_front(round(rat*end)+1:end)];
        Mean_Phase_behind1 = [Mean_Phase_behind1 Mean_Phase_behind(round(rat*end)+1:end)];
        Mean_Phase1 = [Mean_Phase1 Mean_Phase(round(rat*end)+1:end)];
        Mean_AMP_R1 = [Mean_AMP_R1 Mean_AMP_R(round(rat*end)+1:end)];
        Mean_AMP_G1 = [Mean_AMP_G1 Mean_AMP_G(round(rat*end)+1:end)];
        Mean_PEP_R1 = [Mean_PEP_R1 Mean_PEP_R(round(rat*end)+1:end)];
        Mean_PEP_G1 = [Mean_PEP_G1 Mean_PEP_G(round(rat*end)+1:end)];
        PAT_Max_Correct1 = [PAT_Max_Correct1 PAT_Max_Correct(round(rat*end)+1:end)];
        PAT_Min_Correct1 = [PAT_Min_Correct1 PAT_Min_Correct(round(rat*end)+1:end)];
        PAT_Max1 = [PAT_Max1 PAT_Max(round(rat*end)+1:end)];%
        PAT_Min1 = [PAT_Min1 PAT_Min(round(rat*end)+1:end)];
        SBP1 = [SBP1 SBP(round(rat*end)+1:end)];
        DBP1 = [DBP1 DBP(round(rat*end)+1:end)];
        MBP1 = [MBP1 MBP(round(rat*end)+1:end)];

    end
end


Mean_HR_G1 = standardization(Mean_HR_G1);
Mean_HR_R1 = standardization(Mean_HR_R1);
Mean_HR_PG1 = standardization(Mean_HR_PG1);
Mean_HR_EG1 = standardization(Mean_HR_EG1);
Mean_IBI_SG1 = standardization(Mean_IBI_SG1);
Mean_IBI_SR1 = standardization(Mean_IBI_SR1);
SDNN_SG1 = standardization(SDNN_SG1);  %
SDNN_SR1 = standardization(SDNN_SR1);
RMSSD_SG1 = standardization(RMSSD_SG1);
RMSSD_SR1 = standardization(RMSSD_SR1);
pNN50_SR1 = standardization(pNN50_SR1);
pNN50_SG1 = standardization(pNN50_SG1);
pNN20_SR1 = standardization(pNN20_SR1);
pNN20_SG1 = standardization(pNN20_SG1);
VLF_SR1 = standardization(VLF_SR1);
LF_SR1 = standardization(LF_SR1);
HF_SR1 = standardization(HF_SR1);
LFHFratio_SR1 = standardization(LFHFratio_SR1);
VLF_SG1 = standardization(VLF_SG1);
LF_SG1 = standardization(LF_SG1);
HF_SG1 = standardization(HF_SG1);
LFHFratio_SG1 = standardization(LFHFratio_SG1);
RR_SD1_SG1 =standardization(RR_SD1_SG1);
RR_SD2_SG1 =standardization(RR_SD2_SG1);
RR_S1S2_SG1 =standardization(RR_S1S2_SG1);
RR_SD1_SR1 =standardization(RR_SD1_SR1);
RR_SD2_SR1 =standardization(RR_SD2_SR1);
RR_S1S2_SR1 =standardization(RR_S1S2_SR1);
Mean_IBI_PG_max1 = standardization(Mean_IBI_PG_max1);
Mean_IBI_PG_min1 = standardization(Mean_IBI_PG_min1);
SDNN_PG_max1 = standardization(SDNN_PG_max1);
SDNN_PG_min1= standardization(SDNN_PG_min1);
RMSSD_PG_max1 = standardization(RMSSD_PG_max1);
RMSSD_PG_min1 = standardization(RMSSD_PG_min1);
pNN50_PG_max1 = standardization(pNN50_PG_max1);
pNN50_PG_min1 = standardization(pNN50_PG_min1);
pNN20_PG_max1 = standardization(pNN20_PG_max1);
pNN20_PG_min1 = standardization(pNN20_PG_min1);
VLF_PG_min1 = standardization(VLF_PG_min1);
LF_PG_min1 = standardization(LF_PG_min1);
HF_PG_min1 = standardization(HF_PG_min1);
LFHFratio_PG_min1 = standardization(LFHFratio_PG_min1);
VLF_PG_max1 = standardization(VLF_PG_max1);
LF_PG_max1 = standardization(LF_PG_max1);
HF_PG_max1 = standardization(HF_PG_max1);
LFHFratio_PG_max1 = standardization(LFHFratio_PG_max1);
RR_SD1_PG_min1 =standardization(RR_SD1_PG_min1);
RR_SD2_PG_min1 =standardization(RR_SD2_PG_min1);
RR_S1S2_PG_min1 =standardization(RR_S1S2_PG_min1);
RR_SD1_PG_max1 =standardization(RR_SD1_PG_max1);
RR_SD2_PG_max1=standardization(RR_SD2_PG_max1);
RR_S1S2_PG_max1 =standardization(RR_S1S2_PG_max1);
Mean_IBI_EG1 = standardization(Mean_IBI_EG1);
SDNN_EG1 = standardization(SDNN_EG1);
RMSSD_EG1 = standardization(RMSSD_EG1);
pNN20_EG1 = standardization(pNN20_EG1);
pNN50_EG1 = standardization(pNN50_EG1);
RR_SD1_EG1 =standardization(RR_SD1_EG1);
RR_SD2_EG1=standardization(RR_SD2_EG1);
RR_S1S2_EG1 =standardization(RR_S1S2_EG1);
VLF_EG1 = standardization(VLF_EG1);
LF_EG1 = standardization(LF_EG1);
HF_EG1 = standardization(HF_EG1);
LFHFratio_EG1 = standardization(LFHFratio_EG1);
Mean_Phase_front1 = standardization(Mean_Phase_front1);
Mean_Phase_behind1 = standardization(Mean_Phase_behind1);
Mean_Phase1 = standardization(Mean_Phase1);
Mean_AMP_R1 = standardization(Mean_AMP_R1);
Mean_AMP_G1 = standardization(Mean_AMP_G1);
Mean_PEP_R1 = standardization(Mean_PEP_R1);
Mean_PEP_G1 = standardization(Mean_PEP_G1);
PAT_Max_Correct1 = standardization(PAT_Max_Correct1);
PAT_Min_Correct1 = standardization(PAT_Min_Correct1);
PAT_Max1 = standardization(PAT_Max1);
PAT_Min1 = standardization(PAT_Min1);


if flag == "SCG"
     train_data = [Mean_HR_G1',Mean_HR_R1',Mean_Phase1',Mean_AMP_R1',Mean_IBI_SG1',Mean_Phase_front1',...
        Mean_Phase_behind1',Mean_IBI_SR1',...
        SDNN_SG1',SDNN_SR1',RMSSD_SG1',RMSSD_SR1',pNN50_SR1',...
        pNN50_SG1',pNN20_SR1',pNN20_SG1',VLF_SR1',LF_SR1',HF_SR1',LFHFratio_SR1',VLF_SG1',LF_SG1',HF_SG1',LFHFratio_SG1',...
        RR_SD1_SG1',RR_SD2_SG1',RR_S1S2_SG1',RR_SD1_SR1',RR_SD2_SR1',RR_S1S2_SR1',...
        Mean_AMP_G1'];
    train_gt = [SBP1' ,DBP1', MBP1'];
elseif flag == 'PPG'
    train_data = [PAT_Min_Correct1',PAT_Max_Correct1',pNN50_EG1',Mean_IBI_PG_min1',Mean_HR_PG1',Mean_IBI_PG_max1',...
        RMSSD_PG_max1',SDNN_PG_min1',...
        SDNN_PG_max1',RMSSD_PG_min1',pNN50_PG_max1',...
        pNN50_PG_min1',pNN20_PG_max1',pNN20_PG_min1',VLF_PG_min1',LF_PG_min1',...
        HF_PG_min1',LFHFratio_PG_min1',VLF_PG_max1',LF_PG_max1',HF_PG_max1',...
        LFHFratio_PG_max1',RR_SD1_PG_min1',RR_SD2_PG_min1',RR_S1S2_PG_min1',...
        SDNN_EG1',RMSSD_EG1',pNN20_EG1',RR_SD1_EG1',Mean_HR_EG1',...
        RR_SD2_EG1',RR_S1S2_EG1',VLF_EG1',LF_EG1',HF_EG1',...
        LFHFratio_EG1',RR_SD1_PG_max1',RR_SD2_PG_max1',Mean_IBI_EG1',RR_S1S2_PG_max1' ];
    train_gt = [SBP1' ,DBP1', MBP1'];
end


Mean_HR_G1 = [];Mean_HR_R1 = [];Mean_HR_PG1 = [];Mean_HR_EG1 = [];Mean_IBI_SG1 = [];Mean_IBI_SR1 = [];SDNN_SG1 = [];SDNN_SR1 = [];RMSSD_SG1 = [];
RMSSD_SR1 = [];pNN50_SR1 = [];pNN50_SG1 = [];pNN20_SR1 = [];pNN20_SG1 = [];VLF_SR1 = [];LF_SR1 = [];HF_SR1 = [];LFHFratio_SR1 = [];
VLF_SG1 = [];LF_SG1 = [];HF_SG1 = [];LFHFratio_SG1 = [];RR_SD1_SG1 =[ ];RR_SD2_SG1 =[ ];RR_S1S2_SG1 =[ ];RR_SD1_SR1 =[ ];RR_SD2_SR1 =[ ];
RR_S1S2_SR1 =[ ];Mean_IBI_PG_max1 = [];Mean_IBI_PG_min1 = [];SDNN_PG_max1 = [ ];SDNN_PG_min1= [ ];RMSSD_PG_max1 = [ ];RMSSD_PG_min1 =[];
pNN50_PG_max1=[];pNN50_PG_min1=[];pNN20_PG_max1=[];pNN20_PG_min1=[];VLF_PG_min1=[];LF_PG_min1=[];HF_PG_min1 = [];LFHFratio_PG_min1=[];
VLF_PG_max1=[];LF_PG_max1=[];HF_PG_max1=[];LFHFratio_PG_max1=[];RR_SD1_PG_min1=[];RR_SD2_PG_min1=[];RR_S1S2_PG_min1=[];
RR_SD1_PG_max1 =[];RR_SD2_PG_max1=[];RR_S1S2_PG_max1 =[];Mean_IBI_EG1 =[];SDNN_EG1 = [ ];RMSSD_EG1 = [];pNN20_EG1 = [];pNN50_EG1 = [];
RR_SD1_EG1 =[ ];RR_SD2_EG1=[ ];RR_S1S2_EG1 =[ ];VLF_EG1 = [ ];LF_EG1 = [ ];HF_EG1 = [ ];LFHFratio_EG1 = [ ];Mean_Phase_front1 = [];
Mean_Phase_behind1 = [];Mean_Phase1 = [];Mean_AMP_R1 = [];Mean_AMP_G1 = [];Mean_PEP_R1 = [];Mean_PEP_G1 = [];PAT_Max_Correct1 = [];
PAT_Min_Correct1 = [];PAT_Max1 = [];PAT_Min1 = [];SBP1 = [];DBP1 = [];MBP1 = [];
for i = 1:length(index_test)
    if stand == "standar"
        load(num2str(index_test(i)+100));
    else
        load(num2str(index_test(i)));
    end
    if peo == 1
        Mean_HR_G1 = [Mean_HR_G1 Mean_HR_G(round(rat*end)+1:end)];
        Mean_HR_R1 = [Mean_HR_R1 Mean_HR_R(round(rat*end)+1:end)];
        Mean_HR_PG1 = [Mean_HR_PG1 Mean_HR_PG(round(rat*end)+1:end)];
        Mean_HR_EG1 = [Mean_HR_EG1 Mean_HR_EG(round(rat*end)+1:end)];
        Mean_IBI_SG1 = [Mean_IBI_SG1 Mean_IBI_SG(round(rat*end)+1:end)];
        Mean_IBI_SR1 = [Mean_IBI_SR1 Mean_IBI_SR(round(rat*end)+1:end)];
        SDNN_SG1 = [SDNN_SG1 SDNN_SG(round(rat*end)+1:end)];              %
        SDNN_SR1 = [SDNN_SR1 SDNN_SR(round(rat*end)+1:end)];
        RMSSD_SG1 = [RMSSD_SG1 RMSSD_SG(round(rat*end)+1:end)];
        RMSSD_SR1 = [RMSSD_SR1 RMSSD_SR(round(rat*end)+1:end)];
        pNN50_SR1 = [pNN50_SR1 pNN50_SR(round(rat*end)+1:end)];
        pNN50_SG1 = [pNN50_SG1 pNN50_SG(round(rat*end)+1:end)];
        pNN20_SR1 = [pNN20_SR1 pNN20_SR(round(rat*end)+1:end)];
        pNN20_SG1 = [pNN20_SG1 pNN20_SG(round(rat*end)+1:end)];
        VLF_SR1 = [VLF_SR1 VLF_SR(round(rat*end)+1:end)];      %
        LF_SR1 = [LF_SR1 LF_SR(round(rat*end)+1:end)];
        HF_SR1 = [HF_SR1 HF_SR(round(rat*end)+1:end)];
        LFHFratio_SR1 = [LFHFratio_SR1 LFHFratio_SR(round(rat*end)+1:end)];
        VLF_SG1 = [VLF_SG1 VLF_SG(round(rat*end)+1:end)];
        LF_SG1 = [LF_SG1 LF_SG(round(rat*end)+1:end)];
        HF_SG1 = [HF_SG1  HF_SG(round(rat*end)+1:end)];
        LFHFratio_SG1 = [LFHFratio_SG1 LFHFratio_SG(round(rat*end)+1:end)];
        RR_SD1_SG1 =[RR_SD1_SG1 RR_SD1_SG(round(rat*end)+1:end)];
        RR_SD2_SG1 =[RR_SD2_SG1 RR_SD2_SG(round(rat*end)+1:end)];%
        RR_S1S2_SG1 =[RR_S1S2_SG1 RR_S1S2_SG(round(rat*end)+1:end)];
        RR_SD1_SR1 =[RR_SD1_SR1 RR_SD1_SR(round(rat*end)+1:end)];
        RR_SD2_SR1 =[ RR_SD2_SR1 RR_SD2_SR(round(rat*end)+1:end)];
        RR_S1S2_SR1 =[RR_S1S2_SR1 RR_S1S2_SR(round(rat*end)+1:end)];
        Mean_IBI_PG_max1 = [Mean_IBI_PG_max1 Mean_IBI_PG_max(round(rat*end)+1:end)];
        Mean_IBI_PG_min1 = [Mean_IBI_PG_min1 Mean_IBI_PG_min(round(rat*end)+1:end)];
        SDNN_PG_max1 = [SDNN_PG_max1 SDNN_PG_max(round(rat*end)+1:end)];
        SDNN_PG_min1= [SDNN_PG_min1 SDNN_PG_min(round(rat*end)+1:end)];
        RMSSD_PG_max1 = [RMSSD_PG_max1 RMSSD_PG_max(round(rat*end)+1:end)];
        RMSSD_PG_min1 = [RMSSD_PG_min1 RMSSD_PG_min(round(rat*end)+1:end)];
        pNN50_PG_max1 = [pNN50_PG_max1 pNN50_PG_max(round(rat*end)+1:end)];
        pNN50_PG_min1 = [pNN50_PG_min1 pNN50_PG_min(round(rat*end)+1:end)];
        pNN20_PG_max1 = [pNN20_PG_max1 pNN20_PG_max(round(rat*end)+1:end)];
        pNN20_PG_min1 = [pNN20_PG_min1 pNN20_PG_min(round(rat*end)+1:end)];
        VLF_PG_min1 = [VLF_PG_min1 VLF_PG_min(round(rat*end)+1:end)];
        LF_PG_min1 = [LF_PG_min1 LF_PG_min(round(rat*end)+1:end)];
        HF_PG_min1 = [HF_PG_min1 HF_PG_min(round(rat*end)+1:end)];
        LFHFratio_PG_min1 = [ LFHFratio_PG_min1 LFHFratio_PG_min(round(rat*end)+1:end)];
        VLF_PG_max1 = [VLF_PG_max1 VLF_PG_max(round(rat*end)+1:end)];
        LF_PG_max1 = [LF_PG_max1 LF_PG_max(round(rat*end)+1:end)];
        HF_PG_max1 = [HF_PG_max1 HF_PG_max(round(rat*end)+1:end)];
        LFHFratio_PG_max1 = [LFHFratio_PG_max1 LFHFratio_PG_max(round(rat*end)+1:end)];
        RR_SD1_PG_min1 =[RR_SD1_PG_min1 RR_SD1_PG_min(round(rat*end)+1:end)];
        RR_SD2_PG_min1 =[RR_SD2_PG_min1 RR_SD2_PG_min(round(rat*end)+1:end)];
        RR_S1S2_PG_min1 =[RR_S1S2_PG_min1 RR_S1S2_PG_min(round(rat*end)+1:end)];
        RR_SD1_PG_max1 =[RR_SD1_PG_max1 RR_SD1_PG_max(round(rat*end)+1:end)];
        RR_SD2_PG_max1=[RR_SD2_PG_max1 RR_SD2_PG_max(round(rat*end)+1:end)];
        RR_S1S2_PG_max1 =[RR_S1S2_PG_max1 RR_S1S2_PG_max(round(rat*end)+1:end)];
        Mean_IBI_EG1 = [Mean_IBI_EG1 Mean_IBI_EG(round(rat*end)+1:end)];
        SDNN_EG1 = [SDNN_EG1 SDNN_EG(round(rat*end)+1:end)];
        RMSSD_EG1 = [RMSSD_EG1 RMSSD_EG(round(rat*end)+1:end)];
        pNN20_EG1 = [pNN20_EG1 pNN20_EG(round(rat*end)+1:end)];
        pNN50_EG1 = [pNN50_EG1 pNN50_EG(round(rat*end)+1:end)];
        RR_SD1_EG1 =[RR_SD1_EG1 RR_SD1_EG(round(rat*end)+1:end) ];
        RR_SD2_EG1=[RR_SD2_EG1 RR_SD2_EG(round(rat*end)+1:end)];
        RR_S1S2_EG1 =[RR_S1S2_EG1 RR_S1S2_EG(round(rat*end)+1:end)];
        VLF_EG1 = [VLF_EG1 VLF_EG(round(rat*end)+1:end)];
        LF_EG1 = [LF_EG1 LF_EG(round(rat*end)+1:end)];
        HF_EG1 = [HF_EG1 HF_EG(round(rat*end)+1:end)];
        LFHFratio_EG1 = [LFHFratio_EG1 LFHFratio_EG(round(rat*end)+1:end)];
        Mean_Phase_front1 = [Mean_Phase_front1 Mean_Phase_front(round(rat*end)+1:end)];
        Mean_Phase_behind1 = [Mean_Phase_behind1 Mean_Phase_behind(round(rat*end)+1:end)];
        Mean_Phase1 = [Mean_Phase1 Mean_Phase(round(rat*end)+1:end)];
        Mean_AMP_R1 = [Mean_AMP_R1 Mean_AMP_R(round(rat*end)+1:end)];
        Mean_AMP_G1 = [Mean_AMP_G1 Mean_AMP_G(round(rat*end)+1:end)];
        Mean_PEP_R1 = [Mean_PEP_R1 Mean_PEP_R(round(rat*end)+1:end)];
        Mean_PEP_G1 = [Mean_PEP_G1 Mean_PEP_G(round(rat*end)+1:end)];
        PAT_Max_Correct1 = [PAT_Max_Correct1 PAT_Max_Correct(round(rat*end)+1:end)];
        PAT_Min_Correct1 = [PAT_Min_Correct1 PAT_Min_Correct(round(rat*end)+1:end)];
        PAT_Max1 = [PAT_Max1 PAT_Max(round(rat*end)+1:end)];%
        PAT_Min1 = [PAT_Min1 PAT_Min(round(rat*end)+1:end)];
        SBP1 = [SBP1 SBP(round(rat*end)+1:end)];
        DBP1 = [DBP1 DBP(round(rat*end)+1:end)];
        MBP1 = [MBP1 MBP(round(rat*end)+1:end)];


    elseif peo == 2
        rat = rat1;
        rat2 = 1-rat1;
        Mean_HR_G1 = [Mean_HR_G1 Mean_HR_G(round(rat2*end):round(rat*end)-1)];
        Mean_HR_R1 = [Mean_HR_R1 Mean_HR_R(round(rat2*end):round(rat*end)-1)];
        Mean_HR_PG1 = [Mean_HR_PG1 Mean_HR_PG(round(rat2*end):round(rat*end)-1)];
        Mean_HR_EG1 = [Mean_HR_EG1 Mean_HR_EG(round(rat2*end):round(rat*end)-1)];
        Mean_IBI_SG1 = [Mean_IBI_SG1 Mean_IBI_SG(round(rat2*end):round(rat*end)-1)];
        Mean_IBI_SR1 = [Mean_IBI_SR1 Mean_IBI_SR(round(rat2*end):round(rat*end)-1)];
        SDNN_SG1 = [SDNN_SG1 SDNN_SG(round(rat2*end):round(rat*end)-1)];              %
        SDNN_SR1 = [SDNN_SR1 SDNN_SR(round(rat2*end):round(rat*end)-1)];
        RMSSD_SG1 = [RMSSD_SG1 RMSSD_SG(round(rat2*end):round(rat*end)-1)];
        RMSSD_SR1 = [RMSSD_SR1 RMSSD_SR(round(rat2*end):round(rat*end)-1)];
        pNN50_SR1 = [pNN50_SR1 pNN50_SR(round(rat2*end):round(rat*end)-1)];
        pNN50_SG1 = [pNN50_SG1 pNN50_SG(round(rat2*end):round(rat*end)-1)];
        pNN20_SR1 = [pNN20_SR1 pNN20_SR(round(rat2*end):round(rat*end)-1)];
        pNN20_SG1 = [pNN20_SG1 pNN20_SG(round(rat2*end):round(rat*end)-1)];
        VLF_SR1 = [VLF_SR1 VLF_SR(round(rat2*end):round(rat*end)-1)];      %
        LF_SR1 = [LF_SR1 LF_SR(round(rat2*end):round(rat*end)-1)];
        HF_SR1 = [HF_SR1 HF_SR(round(rat2*end):round(rat*end)-1)];
        LFHFratio_SR1 = [LFHFratio_SR1 LFHFratio_SR(round(rat2*end):round(rat*end)-1)];
        VLF_SG1 = [VLF_SG1 VLF_SG(round(rat2*end):round(rat*end)-1)];
        LF_SG1 = [LF_SG1 LF_SG(round(rat2*end):round(rat*end)-1)];
        HF_SG1 = [HF_SG1  HF_SG(round(rat2*end):round(rat*end)-1)];
        LFHFratio_SG1 = [LFHFratio_SG1 LFHFratio_SG(round(rat2*end):round(rat*end)-1)];
        RR_SD1_SG1 =[RR_SD1_SG1 RR_SD1_SG(round(rat2*end):round(rat*end)-1)];
        RR_SD2_SG1 =[RR_SD2_SG1 RR_SD2_SG(round(rat2*end):round(rat*end)-1)];%
        RR_S1S2_SG1 =[RR_S1S2_SG1 RR_S1S2_SG(round(rat2*end):round(rat*end)-1)];
        RR_SD1_SR1 =[RR_SD1_SR1 RR_SD1_SR(round(rat2*end):round(rat*end)-1)];
        RR_SD2_SR1 =[ RR_SD2_SR1 RR_SD2_SR(round(rat2*end):round(rat*end)-1)];
        RR_S1S2_SR1 =[RR_S1S2_SR1 RR_S1S2_SR(round(rat2*end):round(rat*end)-1)];
        Mean_IBI_PG_max1 = [Mean_IBI_PG_max1 Mean_IBI_PG_max(round(rat2*end):round(rat*end)-1)];
        Mean_IBI_PG_min1 = [Mean_IBI_PG_min1 Mean_IBI_PG_min(round(rat2*end):round(rat*end)-1)];
        SDNN_PG_max1 = [SDNN_PG_max1 SDNN_PG_max(round(rat2*end):round(rat*end)-1)];
        SDNN_PG_min1= [SDNN_PG_min1 SDNN_PG_min(round(rat2*end):round(rat*end)-1)];
        RMSSD_PG_max1 = [RMSSD_PG_max1 RMSSD_PG_max(round(rat2*end):round(rat*end)-1)];
        RMSSD_PG_min1 = [RMSSD_PG_min1 RMSSD_PG_min(round(rat2*end):round(rat*end)-1)];
        pNN50_PG_max1 = [pNN50_PG_max1 pNN50_PG_max(round(rat2*end):round(rat*end)-1)];
        pNN50_PG_min1 = [pNN50_PG_min1 pNN50_PG_min(round(rat2*end):round(rat*end)-1)];
        pNN20_PG_max1 = [pNN20_PG_max1 pNN20_PG_max(round(rat2*end):round(rat*end)-1)];
        pNN20_PG_min1 = [pNN20_PG_min1 pNN20_PG_min(round(rat2*end):round(rat*end)-1)];
        VLF_PG_min1 = [VLF_PG_min1 VLF_PG_min(round(rat2*end):round(rat*end)-1)];
        LF_PG_min1 = [LF_PG_min1 LF_PG_min(round(rat2*end):round(rat*end)-1)];
        HF_PG_min1 = [HF_PG_min1 HF_PG_min(round(rat2*end):round(rat*end)-1)];
        LFHFratio_PG_min1 = [ LFHFratio_PG_min1 LFHFratio_PG_min(round(rat2*end):round(rat*end)-1)];
        VLF_PG_max1 = [VLF_PG_max1 VLF_PG_max(round(rat2*end):round(rat*end)-1)];
        LF_PG_max1 = [LF_PG_max1 LF_PG_max(round(rat2*end):round(rat*end)-1)];
        HF_PG_max1 = [HF_PG_max1 HF_PG_max(round(rat2*end):round(rat*end)-1)];
        LFHFratio_PG_max1 = [LFHFratio_PG_max1 LFHFratio_PG_max(round(rat2*end):round(rat*end)-1)];
        RR_SD1_PG_min1 =[RR_SD1_PG_min1 RR_SD1_PG_min(round(rat2*end):round(rat*end)-1)];
        RR_SD2_PG_min1 =[RR_SD2_PG_min1 RR_SD2_PG_min(round(rat2*end):round(rat*end)-1)];
        RR_S1S2_PG_min1 =[RR_S1S2_PG_min1 RR_S1S2_PG_min(round(rat2*end):round(rat*end)-1)];
        RR_SD1_PG_max1 =[RR_SD1_PG_max1 RR_SD1_PG_max(round(rat2*end):round(rat*end)-1)];
        RR_SD2_PG_max1=[RR_SD2_PG_max1 RR_SD2_PG_max(round(rat2*end):round(rat*end)-1)];
        RR_S1S2_PG_max1 =[RR_S1S2_PG_max1 RR_S1S2_PG_max(round(rat2*end):round(rat*end)-1)];
        Mean_IBI_EG1 = [Mean_IBI_EG1 Mean_IBI_EG(round(rat2*end):round(rat*end)-1)];
        SDNN_EG1 = [SDNN_EG1 SDNN_EG(round(rat2*end):round(rat*end)-1)];
        RMSSD_EG1 = [RMSSD_EG1 RMSSD_EG(round(rat2*end):round(rat*end)-1)];
        pNN20_EG1 = [pNN20_EG1 pNN20_EG(round(rat2*end):round(rat*end)-1)];
        pNN50_EG1 = [pNN50_EG1 pNN50_EG(round(rat2*end):round(rat*end)-1)];
        RR_SD1_EG1 =[RR_SD1_EG1 RR_SD1_EG(round(rat2*end):round(rat*end)-1)];
        RR_SD2_EG1=[RR_SD2_EG1 RR_SD2_EG(round(rat2*end):round(rat*end)-1)];
        RR_S1S2_EG1 =[RR_S1S2_EG1 RR_S1S2_EG(round(rat2*end):round(rat*end)-1)];
        VLF_EG1 = [VLF_EG1 VLF_EG(round(rat2*end):round(rat*end)-1)];
        LF_EG1 = [LF_EG1 LF_EG(round(rat2*end):round(rat*end)-1)];
        HF_EG1 = [HF_EG1 HF_EG(round(rat2*end):round(rat*end)-1)];
        LFHFratio_EG1 = [LFHFratio_EG1 LFHFratio_EG(round(rat2*end):round(rat*end)-1)];
        Mean_Phase_front1 = [Mean_Phase_front1 Mean_Phase_front(round(rat2*end):round(rat*end)-1)];
        Mean_Phase_behind1 = [Mean_Phase_behind1 Mean_Phase_behind(round(rat2*end):round(rat*end)-1)];
        Mean_Phase1 = [Mean_Phase1 Mean_Phase(round(rat2*end):round(rat*end)-1)];
        Mean_AMP_R1 = [Mean_AMP_R1 Mean_AMP_R(round(rat2*end):round(rat*end)-1)];
        Mean_AMP_G1 = [Mean_AMP_G1 Mean_AMP_G(round(rat2*end):round(rat*end)-1)];
        Mean_PEP_R1 = [Mean_PEP_R1 Mean_PEP_R(round(rat2*end):round(rat*end)-1)];
        Mean_PEP_G1 = [Mean_PEP_G1 Mean_PEP_G(round(rat2*end):round(rat*end)-1)];
        PAT_Max_Correct1 = [PAT_Max_Correct1 PAT_Max_Correct(round(rat2*end):round(rat*end)-1)];
        PAT_Min_Correct1 = [PAT_Min_Correct1 PAT_Min_Correct(round(rat2*end):round(rat*end)-1)];
        PAT_Max1 = [PAT_Max1 PAT_Max(round(rat2*end):round(rat*end)-1)];%
        PAT_Min1 = [PAT_Min1 PAT_Min(round(rat2*end):round(rat*end)-1)];

        SBP1 = [SBP1 SBP(round(rat2*end):round(rat*end)-1)];
        DBP1 = [DBP1 DBP(round(rat2*end):round(rat*end)-1)];
        MBP1 = [MBP1 MBP(round(rat2*end):round(rat*end)-1)];
    elseif peo == 3
        rat = 1-rat1;
        Mean_HR_G1 = [Mean_HR_G1 Mean_HR_G(1:round(rat*end))];
        Mean_HR_R1 = [Mean_HR_R1 Mean_HR_R(1:round(rat*end))];
        Mean_HR_PG1 = [Mean_HR_PG1 Mean_HR_PG(1:round(rat*end))];
        Mean_HR_EG1 = [Mean_HR_EG1 Mean_HR_EG(1:round(rat*end))];
        Mean_IBI_SG1 = [Mean_IBI_SG1 Mean_IBI_SG(1:round(rat*end))];
        Mean_IBI_SR1 = [Mean_IBI_SR1 Mean_IBI_SR(1:round(rat*end))];
        SDNN_SG1 = [SDNN_SG1 SDNN_SG(1:round(rat*end))];              %
        SDNN_SR1 = [SDNN_SR1 SDNN_SR(1:round(rat*end))];
        RMSSD_SG1 = [RMSSD_SG1 RMSSD_SG(1:round(rat*end))];
        RMSSD_SR1 = [RMSSD_SR1 RMSSD_SR(1:round(rat*end))];
        pNN50_SR1 = [pNN50_SR1 pNN50_SR(1:round(rat*end))];
        pNN50_SG1 = [pNN50_SG1 pNN50_SG(1:round(rat*end))];
        pNN20_SR1 = [pNN20_SR1 pNN20_SR(1:round(rat*end))];
        pNN20_SG1 = [pNN20_SG1 pNN20_SG(1:round(rat*end))];
        VLF_SR1 = [VLF_SR1 VLF_SR(1:round(rat*end))];      %
        LF_SR1 = [LF_SR1 LF_SR(1:round(rat*end))];
        HF_SR1 = [HF_SR1 HF_SR(1:round(rat*end))];
        LFHFratio_SR1 = [LFHFratio_SR1 LFHFratio_SR(1:round(rat*end))];
        VLF_SG1 = [VLF_SG1 VLF_SG(1:round(rat*end))];
        LF_SG1 = [LF_SG1 LF_SG(1:round(rat*end))];
        HF_SG1 = [HF_SG1  HF_SG(1:round(rat*end))];
        LFHFratio_SG1 = [LFHFratio_SG1 LFHFratio_SG(1:round(rat*end))];
        RR_SD1_SG1 =[RR_SD1_SG1 RR_SD1_SG(1:round(rat*end)) ];
        RR_SD2_SG1 =[RR_SD2_SG1 RR_SD2_SG(1:round(rat*end)) ];%
        RR_S1S2_SG1 =[RR_S1S2_SG1 RR_S1S2_SG(1:round(rat*end)) ];
        RR_SD1_SR1 =[RR_SD1_SR1 RR_SD1_SR(1:round(rat*end)) ];
        RR_SD2_SR1 =[ RR_SD2_SR1 RR_SD2_SR(1:round(rat*end))];
        RR_S1S2_SR1 =[RR_S1S2_SR1 RR_S1S2_SR(1:round(rat*end))];
        Mean_IBI_PG_max1 = [Mean_IBI_PG_max1 Mean_IBI_PG_max(1:round(rat*end))];
        Mean_IBI_PG_min1 = [Mean_IBI_PG_min1 Mean_IBI_PG_min(1:round(rat*end))];
        SDNN_PG_max1 = [SDNN_PG_max1 SDNN_PG_max(1:round(rat*end))];
        SDNN_PG_min1= [SDNN_PG_min1 SDNN_PG_min(1:round(rat*end))];
        RMSSD_PG_max1 = [RMSSD_PG_max1 RMSSD_PG_max(1:round(rat*end))];
        RMSSD_PG_min1 = [RMSSD_PG_min1 RMSSD_PG_min(1:round(rat*end))];
        pNN50_PG_max1 = [pNN50_PG_max1 pNN50_PG_max(1:round(rat*end))];
        pNN50_PG_min1 = [pNN50_PG_min1 pNN50_PG_min(1:round(rat*end)) ];
        pNN20_PG_max1 = [pNN20_PG_max1 pNN20_PG_max(1:round(rat*end))];
        pNN20_PG_min1 = [pNN20_PG_min1 pNN20_PG_min(1:round(rat*end)) ];
        VLF_PG_min1 = [VLF_PG_min1 VLF_PG_min(1:round(rat*end)) ];
        LF_PG_min1 = [LF_PG_min1 LF_PG_min(1:round(rat*end)) ];
        HF_PG_min1 = [HF_PG_min1 HF_PG_min(1:round(rat*end)) ];
        LFHFratio_PG_min1 = [ LFHFratio_PG_min1 LFHFratio_PG_min(1:round(rat*end))];
        VLF_PG_max1 = [VLF_PG_max1 VLF_PG_max(1:round(rat*end)) ];
        LF_PG_max1 = [LF_PG_max1 LF_PG_max(1:round(rat*end)) ];
        HF_PG_max1 = [HF_PG_max1 HF_PG_max(1:round(rat*end)) ];
        LFHFratio_PG_max1 = [LFHFratio_PG_max1 LFHFratio_PG_max(1:round(rat*end))];
        RR_SD1_PG_min1 =[RR_SD1_PG_min1 RR_SD1_PG_min(1:round(rat*end)) ];
        RR_SD2_PG_min1 =[RR_SD2_PG_min1 RR_SD2_PG_min(1:round(rat*end))];
        RR_S1S2_PG_min1 =[RR_S1S2_PG_min1 RR_S1S2_PG_min(1:round(rat*end))];
        RR_SD1_PG_max1 =[RR_SD1_PG_max1 RR_SD1_PG_max(1:round(rat*end)) ];
        RR_SD2_PG_max1=[RR_SD2_PG_max1 RR_SD2_PG_max(1:round(rat*end))];
        RR_S1S2_PG_max1 =[RR_S1S2_PG_max1 RR_S1S2_PG_max(1:round(rat*end)) ];
        Mean_IBI_EG1 = [Mean_IBI_EG1 Mean_IBI_EG(1:round(rat*end))];
        SDNN_EG1 = [SDNN_EG1 SDNN_EG(1:round(rat*end)) ];
        RMSSD_EG1 = [RMSSD_EG1 RMSSD_EG(1:round(rat*end))];
        pNN20_EG1 = [pNN20_EG1 pNN20_EG(1:round(rat*end))];
        pNN50_EG1 = [pNN50_EG1 pNN50_EG(1:round(rat*end))];
        RR_SD1_EG1 =[RR_SD1_EG1 RR_SD1_EG(1:round(rat*end)) ];
        RR_SD2_EG1=[RR_SD2_EG1 RR_SD2_EG(1:round(rat*end)) ];
        RR_S1S2_EG1 =[RR_S1S2_EG1 RR_S1S2_EG(1:round(rat*end))];
        VLF_EG1 = [VLF_EG1 VLF_EG(1:round(rat*end))];
        LF_EG1 = [LF_EG1 LF_EG(1:round(rat*end))];
        HF_EG1 = [HF_EG1 HF_EG(1:round(rat*end))];
        LFHFratio_EG1 = [LFHFratio_EG1 LFHFratio_EG(1:round(rat*end))];
        Mean_Phase_front1 = [Mean_Phase_front1 Mean_Phase_front(1:round(rat*end))];
        Mean_Phase_behind1 = [Mean_Phase_behind1 Mean_Phase_behind(1:round(rat*end))];
        Mean_Phase1 = [Mean_Phase1 Mean_Phase(1:round(rat*end))];
        Mean_AMP_R1 = [Mean_AMP_R1 Mean_AMP_R(1:round(rat*end))];
        Mean_AMP_G1 = [Mean_AMP_G1 Mean_AMP_G(1:round(rat*end))];
        Mean_PEP_R1 = [Mean_PEP_R1 Mean_PEP_R(1:round(rat*end))];
        Mean_PEP_G1 = [Mean_PEP_G1 Mean_PEP_G(1:round(rat*end))];
        PAT_Max_Correct1 = [PAT_Max_Correct1 PAT_Max_Correct(1:round(rat*end))];
        PAT_Min_Correct1 = [PAT_Min_Correct1 PAT_Min_Correct(1:round(rat*end))];
        PAT_Max1 = [PAT_Max1 PAT_Max(1:round(rat*end))];%
        PAT_Min1 = [PAT_Min1 PAT_Min(1:round(rat*end))];
        SBP1 = [SBP1 SBP(1:round(rat*end))];
        DBP1 = [DBP1 DBP(1:round(rat*end))];
        MBP1 = [MBP1 MBP(1:round(rat*end))];
    end
end

Mean_HR_G1 = standardization(Mean_HR_G1);
Mean_HR_R1 = standardization(Mean_HR_R1);
Mean_HR_PG1 = standardization(Mean_HR_PG1);
Mean_HR_EG1 = standardization(Mean_HR_EG1);
Mean_IBI_SG1 = standardization(Mean_IBI_SG1);
Mean_IBI_SR1 = standardization(Mean_IBI_SR1);
SDNN_SG1 = standardization(SDNN_SG1);  %
SDNN_SR1 = standardization(SDNN_SR1);
RMSSD_SG1 = standardization(RMSSD_SG1);
RMSSD_SR1 = standardization(RMSSD_SR1);
pNN50_SR1 = standardization(pNN50_SR1);
pNN50_SG1 = standardization(pNN50_SG1);
pNN20_SR1 = standardization(pNN20_SR1);
pNN20_SG1 = standardization(pNN20_SG1);
VLF_SR1 = standardization(VLF_SR1);
LF_SR1 = standardization(LF_SR1);
HF_SR1 = standardization(HF_SR1);
LFHFratio_SR1 = standardization(LFHFratio_SR1);
VLF_SG1 = standardization(VLF_SG1);
LF_SG1 = standardization(LF_SG1);
HF_SG1 = standardization(HF_SG1);
LFHFratio_SG1 = standardization(LFHFratio_SG1);
RR_SD1_SG1 =standardization(RR_SD1_SG1);
RR_SD2_SG1 =standardization(RR_SD2_SG1);
RR_S1S2_SG1 =standardization(RR_S1S2_SG1);
RR_SD1_SR1 =standardization(RR_SD1_SR1);
RR_SD2_SR1 =standardization(RR_SD2_SR1);
RR_S1S2_SR1 =standardization(RR_S1S2_SR1);
Mean_IBI_PG_max1 = standardization(Mean_IBI_PG_max1);
Mean_IBI_PG_min1 = standardization(Mean_IBI_PG_min1);
SDNN_PG_max1 = standardization(SDNN_PG_max1);
SDNN_PG_min1= standardization(SDNN_PG_min1);
RMSSD_PG_max1 = standardization(RMSSD_PG_max1);
RMSSD_PG_min1 = standardization(RMSSD_PG_min1);
pNN50_PG_max1 = standardization(pNN50_PG_max1);
pNN50_PG_min1 = standardization(pNN50_PG_min1);
pNN20_PG_max1 = standardization(pNN20_PG_max1);
pNN20_PG_min1 = standardization(pNN20_PG_min1);
VLF_PG_min1 = standardization(VLF_PG_min1);
LF_PG_min1 = standardization(LF_PG_min1);
HF_PG_min1 = standardization(HF_PG_min1);
LFHFratio_PG_min1 = standardization(LFHFratio_PG_min1);
VLF_PG_max1 = standardization(VLF_PG_max1);
LF_PG_max1 = standardization(LF_PG_max1);
HF_PG_max1 = standardization(HF_PG_max1);
LFHFratio_PG_max1 = standardization(LFHFratio_PG_max1);
RR_SD1_PG_min1 =standardization(RR_SD1_PG_min1);
RR_SD2_PG_min1 =standardization(RR_SD2_PG_min1);
RR_S1S2_PG_min1 =standardization(RR_S1S2_PG_min1);
RR_SD1_PG_max1 =standardization(RR_SD1_PG_max1);
RR_SD2_PG_max1=standardization(RR_SD2_PG_max1);
RR_S1S2_PG_max1 =standardization(RR_S1S2_PG_max1);
Mean_IBI_EG1 = standardization(Mean_IBI_EG1);
SDNN_EG1 = standardization(SDNN_EG1);
RMSSD_EG1 = standardization(RMSSD_EG1);
pNN20_EG1 = standardization(pNN20_EG1);
pNN50_EG1 = standardization(pNN50_EG1);
RR_SD1_EG1 =standardization(RR_SD1_EG1);
RR_SD2_EG1=standardization(RR_SD2_EG1);
RR_S1S2_EG1 =standardization(RR_S1S2_EG1);
VLF_EG1 = standardization(VLF_EG1);
LF_EG1 = standardization(LF_EG1);
HF_EG1 = standardization(HF_EG1);
LFHFratio_EG1 = standardization(LFHFratio_EG1);
Mean_Phase_front1 = standardization(Mean_Phase_front1);
Mean_Phase_behind1 = standardization(Mean_Phase_behind1);
Mean_Phase1 = standardization(Mean_Phase1);
Mean_AMP_R1 = standardization(Mean_AMP_R1);
Mean_AMP_G1 = standardization(Mean_AMP_G1);
Mean_PEP_R1 = standardization(Mean_PEP_R1);
Mean_PEP_G1 = standardization(Mean_PEP_G1);
PAT_Max_Correct1 = standardization(PAT_Max_Correct1);
PAT_Min_Correct1 = standardization(PAT_Min_Correct1);
PAT_Max1 = standardization(PAT_Max1);
PAT_Min1 = standardization(PAT_Min1);

if flag == "SCG"
test_data = [Mean_HR_G1',Mean_HR_R1',Mean_Phase1',Mean_AMP_R1',Mean_IBI_SG1',Mean_Phase_front1',...
        Mean_Phase_behind1',Mean_IBI_SR1',...
        SDNN_SG1',SDNN_SR1',RMSSD_SG1',RMSSD_SR1',pNN50_SR1',...
        pNN50_SG1',pNN20_SR1',pNN20_SG1',VLF_SR1',LF_SR1',HF_SR1',LFHFratio_SR1',VLF_SG1',LF_SG1',HF_SG1',LFHFratio_SG1',...
        RR_SD1_SG1',RR_SD2_SG1',RR_S1S2_SG1',RR_SD1_SR1',RR_SD2_SR1',RR_S1S2_SR1',...
        Mean_AMP_G1'];
    test_gt = [SBP1' ,DBP1', MBP1'];
elseif flag == 'PPG'
    test_data = [PAT_Min_Correct1',PAT_Max_Correct1',pNN50_EG1',Mean_IBI_PG_min1',Mean_HR_PG1',Mean_IBI_PG_max1',...
        RMSSD_PG_max1',SDNN_PG_min1',...
        SDNN_PG_max1',RMSSD_PG_min1',pNN50_PG_max1',...
        pNN50_PG_min1',pNN20_PG_max1',pNN20_PG_min1',VLF_PG_min1',LF_PG_min1',...
        HF_PG_min1',LFHFratio_PG_min1',VLF_PG_max1',LF_PG_max1',HF_PG_max1',...
        LFHFratio_PG_max1',RR_SD1_PG_min1',RR_SD2_PG_min1',RR_S1S2_PG_min1',...
        SDNN_EG1',RMSSD_EG1',pNN20_EG1',RR_SD1_EG1',Mean_HR_EG1',...
        RR_SD2_EG1',RR_S1S2_EG1',VLF_EG1',LF_EG1',HF_EG1',...
        LFHFratio_EG1',RR_SD1_PG_max1',RR_SD2_PG_max1',Mean_IBI_EG1',RR_S1S2_PG_max1' ];
    test_gt = [SBP1' ,DBP1', MBP1'];
end



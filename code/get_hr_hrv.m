close all; clear; clc;

load("1-1.mat")
load("1-1-feature.mat")
name = "1.1";

offset = 28;

erro = [];
Mean_HR_G = [];
Mean_HR_R = [];
Mean_HR_PG = [];
Mean_HR_EG = [];

Mean_IBI_SG = [];
Mean_IBI_SR = [];
SDNN_SG = [];
SDNN_SR = [];
RMSSD_SG = [];
RMSSD_SR = [];
pNN50_SR = [];
pNN50_SG = [];
pNN20_SR = [];
pNN20_SG = [];
VLF_SR = [];
LF_SR = [];
HF_SR = [];
LFHFratio_SR = [];
VLF_SG = [];
LF_SG = [];
HF_SG = [];
LFHFratio_SG = [];
RR_SD1_SG =[ ];
RR_SD2_SG=[ ];
RR_S1S2_SG =[ ];
RR_SD1_SR =[ ];
RR_SD2_SR=[ ];
RR_S1S2_SR =[ ];


Mean_IBI_PG_max = [];
Mean_IBI_PG_min = [];
SDNN_PG_max = [ ];
SDNN_PG_min = [ ];
RMSSD_PG_max = [ ];
RMSSD_PG_min = [ ];
pNN50_PG_max = [ ];
pNN50_PG_min = [ ];
pNN20_PG_max = [ ];
pNN20_PG_min = [ ];
VLF_PG_min = [ ];
LF_PG_min = [ ];
HF_PG_min = [ ];
LFHFratio_PG_min = [ ];
VLF_PG_max = [ ];
LF_PG_max = [ ];
HF_PG_max = [ ];
LFHFratio_PG_max = [ ];
RR_SD1_PG_min =[ ];
RR_SD2_PG_min=[ ];
RR_S1S2_PG_min =[ ];
RR_SD1_PG_max =[ ];
RR_SD2_PG_max=[ ];
RR_S1S2_PG_max =[ ];

Mean_IBI_EG = [];
SDNN_EG = [ ];
RMSSD_EG = [];
pNN20_EG = [];
pNN50_EG = [];
RR_SD1_EG =[ ];
RR_SD2_EG=[ ];
RR_S1S2_EG =[ ];
VLF_EG = [ ];
LF_EG = [ ];
HF_EG = [ ];
LFHFratio_EG = [ ];




for echo = 1:length(BP_index)
    
    signalg = Dxyg((BP_index(echo)-offset)*250+1:((BP_index(echo))*250));  
    % HR_Gr = HR((BP_index(echo)-offset+1):(BP_index(echo))); 
    [D_spcg, ~] = spec(signalg, offset, 250);  
    [ampg, hr_pre_G] = max(D_spcg(1:110));
    Mean_HR_G = [Mean_HR_G hr_pre_G];

     signalr = Dxyr((BP_index(echo)-offset)*250+1:((BP_index(echo))*250));  
    % HR_Gr = HR((BP_index(echo)-offset+1):(BP_index(echo))); 
    [D_spcr, ~] = spec(signalr, offset, 250);  
    [ampr, hr_pre_R] = max(D_spcr(1:110));
    Mean_HR_R = [Mean_HR_R hr_pre_R];

     signalpg = PPG((BP_index(echo)-offset)*60+1:((BP_index(echo))*60));  
    % HR_Gr = HR((BP_index(echo)-offset+1):(BP_index(echo))); 
    [D_spcpg, ~] = spec(signalpg, offset, 60);  
    [ampp, hr_pre_pg] = max(D_spcpg(1:110));
    Mean_HR_PG = [Mean_HR_PG hr_pre_pg];

     signaleg = ECG((BP_index(echo)-offset)*500+1:((BP_index(echo))*500));  
    % HR_Gr = HR((BP_index(echo)-offset+1):(BP_index(echo))); 
    [D_spceg, ~] = spec(signaleg, offset, 500);  
    [ampe, hr_pre_eg] = max(D_spceg(1:110));
    Mean_HR_EG = [Mean_HR_EG hr_pre_eg];

    % IBI
    if echo ~= 1
        IBI_SG = diff(Peck_G(sum(Peck_num(1:echo-1))+1: sum(Peck_num(1:echo))));
        Mean_IBI_SG = [Mean_IBI_SG mean(IBI_SG)*3.994];
        IBI_SR = diff(Peck_R(sum(Peck_num(1:echo-1))+1: sum(Peck_num(1:echo))));
        Mean_IBI_SR = [Mean_IBI_SR mean(IBI_SR)*3.994];

        IBI_PG_max = diff(PPG_Max_Peck_Correct(sum(Peck_num(1:echo-1))+1: sum(Peck_num(1:echo))));
        Mean_IBI_PG_max = [Mean_IBI_PG_max mean(IBI_PG_max/60*1000)];
        IBI_PG_min = diff(PPG_Min_Peck_Correct(sum(Peck_num(1:echo-1))+1: sum(Peck_num(1:echo))));
        Mean_IBI_PG_min = [Mean_IBI_PG_min mean(IBI_PG_min/60*1000)];

        IBI_EG = diff(ECG_Peck(sum(Peck_num(1:echo-1))+1: sum(Peck_num(1:echo))));
        Mean_IBI_EG = [Mean_IBI_EG mean(IBI_EG*2)];
    else
        IBI_SG = diff(Peck_G(1:Peck_num(1)));
        Mean_IBI_SG = [Mean_IBI_SG mean(IBI_SG)*3.994];
        IBI_SR = diff(Peck_R(1:Peck_num(1)));
        Mean_IBI_SR = [Mean_IBI_SR mean(IBI_SR)*3.994];
        
        IBI_PG_max = diff(PPG_Max_Peck_Correct(1:Peck_num(1)));
        Mean_IBI_PG_max = [Mean_IBI_PG_max mean(IBI_PG_max/60*1000)];
        IBI_PG_min = diff(PPG_Min_Peck_Correct(1:Peck_num(1)));
        Mean_IBI_PG_min = [Mean_IBI_PG_min mean(IBI_PG_min/60*1000)];

        IBI_EG = diff(ECG_Peck((1:Peck_num(1))));
        Mean_IBI_EG = [Mean_IBI_EG mean(IBI_EG*2)];
    end

    % HRV
    SDNN_SG = [SDNN_SG std(IBI_SG*3.994)];
    SDNN_SR = [SDNN_SR std(IBI_SR*3.994)];
    SDNN_PG_max = [SDNN_PG_max std(IBI_PG_max/60*1000)];
    SDNN_PG_min = [SDNN_PG_min std(IBI_PG_min/60*1000)];
    SDNN_EG = [SDNN_EG std(IBI_EG*2)];

    RMSSD_SR = [RMSSD_SR sqrt((sum((diff(IBI_SR*3.994)).^2))/(length(IBI_SR*3.994)-1))];
    RMSSD_SG = [RMSSD_SG sqrt((sum((diff(IBI_SG*3.994)).^2))/(length(IBI_SG*3.994)-1))];
    RMSSD_PG_max = [RMSSD_PG_max sqrt((sum((diff(IBI_PG_max/60*1000)).^2))/(length(IBI_PG_max/60*1000)-1))];
    RMSSD_PG_min = [RMSSD_PG_min sqrt((sum((diff(IBI_PG_min/60*1000)).^2))/(length(IBI_PG_min/60*1000)-1))];
    RMSSD_EG = [RMSSD_EG sqrt((sum((diff(IBI_EG*2)).^2))/(length(IBI_EG*2)-1))];
    
    pNN50_SR = [pNN50_SR (sum(abs(diff(IBI_SR*3.994))>50)/(length(IBI_SR*3.994)-1))*100 ];
    pNN50_SG = [pNN50_SG (sum(abs(diff(IBI_SG*3.994))>50)/(length(IBI_SG*3.994)-1))*100 ];
    pNN50_PG_max = [pNN50_PG_max (sum(abs(diff(IBI_PG_max/60*1000))>50)/(length(IBI_PG_max/60*1000)-1))*100 ];
    pNN50_PG_min = [pNN50_PG_min (sum(abs(diff(IBI_PG_min/60*1000))>50)/(length(IBI_PG_min/60*1000)-1))*100 ];
    pNN50_EG = [pNN50_EG (sum(abs(diff(IBI_EG*2))>50)/(length(IBI_EG*2)-1))*100 ];

    pNN20_SR = [pNN20_SR (sum(abs(diff(IBI_SR*3.994))>20)/(length(IBI_SR*3.994)-1))*100 ];
    pNN20_SG = [pNN20_SG (sum(abs(diff(IBI_SG*3.994))>20)/(length(IBI_SG*3.994)-1))*100 ];
    pNN20_PG_max = [pNN20_PG_max (sum(abs(diff(IBI_PG_max/60*1000))>20)/(length(IBI_PG_max/60*1000)-1))*100 ];
    pNN20_PG_min = [pNN20_PG_min (sum(abs(diff(IBI_PG_min/60*1000))>20)/(length(IBI_PG_min/60*1000)-1))*100 ];
    pNN20_EG = [pNN20_EG (sum(abs(diff(IBI_EG*2))>20)/(length(IBI_EG*2)-1))*100 ];
    

    RRs_SR = IBI_SR*3.994./1000;  % 3.994 1000/video frame rate
    [VLF_R,LF_R,HF_R,LFHFratio_R] = spectral_analysis_HRV(RRs_SR,250);
    VLF_SR = [VLF_SR VLF_R];
    LF_SR = [LF_SR LF_R];
    HF_SR = [HF_SR HF_R];
    LFHFratio_SR = [LFHFratio_SR LFHFratio_R];

    RRs_SG = IBI_SG*3.994./1000;
    [VLF_G,LF_G,HF_G,LFHFratio_G] = spectral_analysis_HRV(RRs_SG,250);
    VLF_SG = [VLF_SG VLF_G];
    LF_SG = [LF_SG LF_G];
    HF_SG = [HF_SG HF_G];
    LFHFratio_SG = [LFHFratio_SG LFHFratio_G];

    RRs_PG_max = (IBI_PG_max/60*1000)./1000;
    [VLF_max,LF_max,HF_max,LFHFratio_max] = spectral_analysis_HRV(RRs_PG_max,60);
    VLF_PG_max = [VLF_PG_max VLF_max ];
    LF_PG_max = [LF_PG_max LF_max ];
    HF_PG_max = [HF_PG_max HF_max ];
    LFHFratio_PG_max = [LFHFratio_PG_max LFHFratio_max ];

    RRs_PG_min = (IBI_PG_min/60*1000)./1000;
    [VLF_min,LF_min,HF_min,LFHFratio_min] = spectral_analysis_HRV(RRs_PG_min,60);
    VLF_PG_min = [VLF_PG_min VLF_min ];
    LF_PG_min = [LF_PG_min LF_min ];
    HF_PG_min = [HF_PG_min HF_min ];
    LFHFratio_PG_min = [LFHFratio_PG_min LFHFratio_min ];

    RRs_EG = (IBI_EG*2)./1000;
    [VLF_E,LF_E,HF_E,LFHFratio_E] = spectral_analysis_HRV(RRs_EG,60);
    VLF_EG = [VLF_EG VLF_E];
    LF_EG = [LF_EG LF_E];
    HF_EG = [HF_EG HF_E];
    LFHFratio_EG = [LFHFratio_EG LFHFratio_E];
 
    RR_SD1_SG =[RR_SD1_SG  sqrt(var(diff(IBI_SG*3.994)/sqrt(2)))];
    RR_SD2_SG=[RR_SD2_SG sqrt((2*(std(IBI_SG*3.994)^2))-(sqrt(var(diff(IBI_SG*3.994)/sqrt(2)))^2))];
    RR_S1S2_SG =[RR_S1S2_SG RR_SD1_SG/RR_SD2_SG];

    RR_SD1_SR =[RR_SD1_SR  sqrt(var(diff(IBI_SR*3.994)/sqrt(2)))];
    RR_SD2_SR=[RR_SD2_SR sqrt((2*(std(IBI_SR*3.994)^2))-(sqrt(var(diff(IBI_SR*3.994)/sqrt(2)))^2))];
    RR_S1S2_SR =[RR_S1S2_SR RR_SD1_SR/RR_SD2_SR];

    RR_SD1_PG_min =[RR_SD1_PG_min  sqrt(var(diff(IBI_PG_min/60*1000)/sqrt(2)))];
    RR_SD2_PG_min=[RR_SD2_PG_min sqrt((2*(std(IBI_PG_min/60*1000)^2))-(sqrt(var(diff(IBI_PG_min/60*1000)/sqrt(2)))^2))];
    RR_S1S2_PG_min =[RR_S1S2_PG_min RR_SD1_PG_min/RR_SD2_PG_min];

    RR_SD1_PG_max =[RR_SD1_PG_max  sqrt(var(diff(IBI_PG_max/60*1000)/sqrt(2)))];
    RR_SD2_PG_max=[RR_SD2_PG_max sqrt((2*(std(IBI_PG_max/60*1000)^2))-(sqrt(var(diff(IBI_PG_max/60*1000)/sqrt(2)))^2))];
    RR_S1S2_PG_max =[RR_S1S2_PG_max RR_SD1_PG_max/RR_SD2_PG_max];

    RR_SD1_EG =[RR_SD1_EG  sqrt(var(diff(IBI_EG*2)/sqrt(2)))];
    RR_SD2_EG=[RR_SD2_EG sqrt((2*(std(IBI_EG*2)^2))-(sqrt(var(diff(IBI_EG*2)/sqrt(2)))^2))];
    RR_S1S2_EG =[RR_S1S2_EG RR_SD1_EG/RR_SD2_EG];
 

  
end



save(strcat(name,'.mat'))



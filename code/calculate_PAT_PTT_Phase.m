function [PAT_Max_Correct,PAT_Min_Correct,PAT_Max,PAT_Min,PPG_Max_Peck_Correct,PPG_Min_Peck_Correct,PPG_Max_Peck,PPG_Min_Peck,ECG_Peck,Peck_R,Peck_G,...
    Mean_Phase,Phase,PEP_R,PEP_G,Mean_PEP_R,Mean_PEP_G,PTT_R_Max,PTT_G_Max,PTT_R_Min,PTT_G_Min,Mean_Phase_front,Mean_Phase_behind,...
    AMP_R,AMP_G,Mean_AMP_R,Mean_AMP_G,Peck_num] ...
    = calculate_PAT_PTT_Phase(ECG,PPG,Dxyr,Dxyg,t,single_length,plot_fig,flag,offset)
 
PAT_Min_Correct = [];
PAT_Max_Correct = [];

PAT_Min = [];
PAT_Max = [];

ECG_Peck = [];
PPG_Max_Peck_Correct  = [];
PPG_Min_Peck_Correct  = [];

PPG_Max_Peck = [];
PPG_Min_Peck = [];
Peck_num = [];

fps = 250;
Peck_G = [];
Peck_R = [];
AMP_G = [];
AMP_R = [];

Mean_AMP_G = [];
Mean_AMP_R = [];

Mean_Phase = [];
Phase = [];

PEP_R = [];
PEP_G =[];

Mean_PEP_R = [];
Mean_PEP_G = [];

PTT_R = [];
PTT_G = [];

PTT_R_Max = []; 
PTT_G_Max = []; 
PTT_R_Min = [];  
PTT_G_Min = []; 
Mean_Phase_front = [];
Mean_Phase_behind = [];


if t(1)<single_length
    single_length = t(1);
elseif   t(1)==single_length
    single_length = single_length;
end

 
lowwidth = [0.8];  
[ne, de] = butter(4, lowwidth/(250/2), 'low');
R_low = filtfilt(ne,de,Dxyr')';
G_low = filtfilt(ne,de,Dxyg')';
SCG_R_detrend = Dxyr - R_low;
SCG_G_detrend = Dxyg - G_low;

 
bandwidth = [0.8, 50];
[n, d] = butter(2, bandwidth/(fps/2), 'bandpass');
SCG_R_band = filtfilt(n,d,SCG_R_detrend')';
SCG_G_band = filtfilt(n,d,SCG_G_detrend')';

ECG_detrend = filtfilt(n,d,ECG')';

 
SCG_R = wdenoise(SCG_R_band, round(log(length(SCG_G_band)) / log(2)), 'DenoisingMethod', 'FDR', 'Wavelet', 'sym4');
SCG_G = wdenoise(SCG_G_band, round(log(length(SCG_G_band)) / log(2)), 'DenoisingMethod', 'FDR', 'Wavelet', 'sym4');

t_end = t(length(t));
if length(Dxyr)/250 < t_end+3
    t(length(t)) = t_end-3;
end


for echo = 1 :length(t) 
 
    peck_ppg_min = [];
    peck_ppg_max = [];
    
    ppgpeck_max = [];
    ppgpeck_min =[];

    peck_r = [];
    peck_g = [];

     
 
    ecg_bp = ECG_detrend((t(echo)-single_length)*500+1:(t(echo))*500+0);   
    ppg_bp = PPG((t(echo)-single_length)*60+1:(t(echo))*60+60*4);
   
    [~, locsecg] = findpeaks(ecg_bp,"MinPeakHeight",800,"MinPeakDistance",250);   
    [~, locsppg_max] = findpeaks(ppg_bp,"MinPeakHeight",50,"MinPeakDistance",30);   


    len = length(locsecg);
    len_ppg = length(locsppg_max);
    if locsecg(1)<50
        locsecg = locsecg(2:len);
        locsppg_max = locsppg_max(2:len_ppg);
    elseif locsecg(len)>13500
        locsecg = locsecg(1:len-1);
        locsppg_max = locsppg_max(1:len_ppg-1);
    end
    
    peck_number = length(locsecg);

    Peck_num = [Peck_num peck_number];
    ECG_Peck = [ECG_Peck locsecg];
  
    time_ppg =  diff(locsppg_max)/60*1000;
    time_ecg =  diff(locsecg)/500*1000;

    size_window = length(time_ecg);
    
    max_corr_offset = 0;
    max_corr = -2;
    for i = 1:length(time_ppg)-length(time_ecg)
        t_ppg = time_ppg(1+i-1:size_window+i-1);
        
        corr_matrixS = corrcoef(t_ppg,time_ecg);
        corr = corr_matrixS(1, 2);
         
        if corr > max_corr
            max_corr = corr;
            max_corr_offset = i-1;
        end
    end
    if plot_fig == 1
        disp([num2str(echo),' | ',num2str(max_corr_offset),' | ',num2str(max_corr)]);
    end

    peck_ecg = locsecg;
    peck_ppg_max = locsppg_max(max_corr_offset+1:max_corr_offset+1+size_window);
    
    ppg_offset = 30;

    for pk = 1:length(peck_ppg_max)
        if (pk==1) && (peck_ppg_max(1)>ppg_offset)
            [~, idx_min] = max(-(ppg_bp(peck_ppg_max(1)-ppg_offset+1:peck_ppg_max(pk))));
            peck_ppg_min = [peck_ppg_min idx_min+peck_ppg_max(1)-ppg_offset];
        elseif(pk==1) && (peck_ppg_max(1)<ppg_offset)
            [~, idx_min] = max(-(ppg_bp(peck_ppg_max(1)-peck_ppg_max(1)+1:peck_ppg_max(pk))));
            peck_ppg_min = [peck_ppg_min idx_min+peck_ppg_max(1)-peck_ppg_max(1)];
        else
            [~, idx_min] = max(-(ppg_bp(peck_ppg_max(pk)-ppg_offset+1:peck_ppg_max(pk))));
            peck_ppg_min = [peck_ppg_min idx_min+peck_ppg_max(pk)-ppg_offset];
        end
    end
    PPG_Max_Peck_Correct  = [PPG_Max_Peck_Correct peck_ppg_max];
    PPG_Min_Peck_Correct  = [PPG_Min_Peck_Correct peck_ppg_min];

    PAT_Max_Correct = [PAT_Max_Correct mean((peck_ppg_max)/60*1000-(peck_ecg)/500*1000)];
    PAT_Min_Correct = [PAT_Min_Correct mean((peck_ppg_min)/60*1000-(peck_ecg)/500*1000)];


    if locsppg_max(1)/60*1000>locsecg(1)/500*1000
        ppgpeck_max = locsppg_max(1:length(locsecg));
    else 
        ppgpeck_max = locsppg_max(2:length(locsecg)+1);
    end

    for pk = 1:length(ppgpeck_max)
        if (pk==1)&&(ppgpeck_max(1)<ppg_offset)
            [~, idx_min] = max(-(ppg_bp(ppgpeck_max(pk)-ppgpeck_max(1)+1:ppgpeck_max(pk))));
            ppgpeck_min = [ppgpeck_min idx_min+ppgpeck_max(pk)-ppgpeck_max(1) ];
        else
            [~, idx_min] = max(-(ppg_bp(ppgpeck_max(pk)-ppg_offset+1:ppgpeck_max(pk))));
            ppgpeck_min = [ppgpeck_min idx_min+ppgpeck_max(pk)-ppg_offset];
        end
    end
    PPG_Max_Peck = [PPG_Max_Peck ppgpeck_max];
    PPG_Min_Peck = [PPG_Min_Peck ppgpeck_min];

    PAT_Max = [PAT_Max mean((ppgpeck_max)/60*1000-(locsecg)/500*1000)];
    PAT_Min = [PAT_Min mean((ppgpeck_min)/60*1000-(locsecg)/500*1000)];

    if (t(echo)*250)+250*4 <72500  
        Dr = SCG_R((t(echo)-single_length)*250+1:(t(echo)*250)+250*4);
        Dg = SCG_G((t(echo)-single_length)*250+1:(t(echo)*250)+250*4);
    else 
        Dr = SCG_R((t(echo)-single_length)*250+1:(t(echo)*250));
        Dg = SCG_G((t(echo)-single_length)*250+1:(t(echo)*250)+250);
    end
    
    [ampg, peck] = findpeaks(Dg,"MinPeakHeight",2,"MinPeakDistance",140);  

    peck_g = peck;
    l = length(peck_g);
    for i = 1:l-length(locsecg)
        while (peck_g(1)*4)<(locsecg(1)*2)
            peck_g = peck_g(2:length(peck_g));
            ampg = ampg(2:length(peck_g));
        end
    end
  
    peck_g = peck_g(1:peck_number);

    ampg = ampg(1:peck_number);
    Peck_G = [Peck_G peck_g];
    AMP_G = [AMP_G ampg];
    Mean_AMP_G = [Mean_AMP_G  mean(ampg)];

    
    ampr = [];
    for pks = 1:length(peck_g)
        if flag == 0
            if (peck_g(pks)>offset)
                [amp , idx_pks] = max((Dr(peck_g(pks)-offset+1:peck_g(pks) )));
                peck_r = [peck_r idx_pks+peck_g(pks)-offset];
                ampr(pks) = amp;
            else
                [amp , idx_pks] = max((Dr(peck_g(pks)-peck_g(pks)+1:peck_g(pks) )));
                peck_r = [peck_r idx_pks+peck_g(pks)-peck_g(pks)];
                ampr(pks) = amp;
            end

        elseif flag == 1
            if length(Dr)>peck_g(pks)+offset
                [amp , idx_pks] = max((Dr(peck_g(pks):peck_g(pks)+offset)));
                peck_r = [peck_r idx_pks+peck_g(pks)-1];
                ampr(pks) = amp;
            else
                [amp , idx_pks] = max((Dr(peck_g(pks):length(Dr))));
                peck_r = [peck_r idx_pks+peck_g(pks)-1];
                ampr(pks) = amp;
            end
        end
    end

    Peck_R = [Peck_R peck_r];
    AMP_R = [AMP_R ampr];
    Mean_AMP_R = [Mean_AMP_R  mean(ampr)];


    time_scg_r =  diff(peck_r)/250*1000;
    time_scg_g =  diff(peck_g)/250*1000;

    Phase = [Phase (peck_r-peck_g)*4];
    Mean_Phase = [Mean_Phase mean((peck_r-peck_g)*4)];

    for i=1:length(peck_g)
        if peck_g(i)<250*13+125
           front_idx = i ;
        end
    end

    Mean_Phase_front = [Mean_Phase_front mean((peck_r(1:front_idx)-peck_g(1:front_idx))*4)];
    Mean_Phase_behind = [Mean_Phase_behind mean((peck_r(front_idx+1:length(peck_g))-peck_g(front_idx+1:length(peck_g)))*4)];

    PEP_R = [PEP_R peck_r*4-locsecg*2];
    PEP_G = [PEP_G peck_g*4-locsecg*2];

    Mean_PEP_R = [Mean_PEP_R mean(peck_r*4-locsecg*2)];
    Mean_PEP_G = [Mean_PEP_G mean(peck_g*4-locsecg*2)];

    PTT_R_Max = [PTT_R_Max mean(peck_ppg_max/60*1000 - peck_r*4)];
    PTT_G_Max = [PTT_G_Max mean(peck_ppg_max/60*1000 - peck_g*4)];

    PTT_R_Min = [PTT_R_Min mean(peck_ppg_min/60*1000 - peck_r*4)];
    PTT_G_Min = [PTT_G_Min mean(peck_ppg_min/60*1000 - peck_g*4)];

if plot_fig == 1
    figure
    subplot(6,1,1)
    plot(ecg_bp); hold on
    scatter(locsecg(~isnan(locsecg)),ecg_bp(locsecg(~isnan(locsecg))),"filled")
    subplot(6,1,2)
    plot(ppg_bp);hold on
    scatter(peck_ppg_max(~isnan(peck_ppg_max)),ppg_bp(peck_ppg_max(~isnan(peck_ppg_max))),"filled") ;hold on
    scatter(peck_ppg_min(~isnan(peck_ppg_min)),ppg_bp(peck_ppg_min(~isnan(peck_ppg_min))),"filled") ;hold on
    
    subplot(6,1,3)
    plot(ppg_bp);hold on
    scatter(ppgpeck_max(~isnan(ppgpeck_max)),ppg_bp(ppgpeck_max(~isnan(ppgpeck_max))),"filled") ;hold on
    scatter(ppgpeck_min(~isnan(ppgpeck_min)),ppg_bp(ppgpeck_min(~isnan(ppgpeck_min))),"filled") ;hold on
    % scatter(locsppg,PPG1(locsppg),"filled") ;hold on
    subplot(6,1,4)
    plot(Dr);hold on
    scatter(peck_r(~isnan(peck_r)),Dr(peck_r(~isnan(peck_r))),"filled") ;hold on
    subplot(6,1,5)
    plot(Dg);hold on
    scatter(peck_g(~isnan(peck_g)),Dg(peck_g(~isnan(peck_g))),"filled") ;hold on
    subplot(6,1,6)
    plot(time_ecg,Color='r');hold on
    plot(time_ppg,Color='g');hold on
    plot(time_scg_r,Color='b');hold on
    plot(time_scg_g,Color='m');hold on
end

end
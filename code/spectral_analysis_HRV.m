function [VLF,LF,HF,LFHFratio] = spectral_analysis_HRV(RR,Fs,type)

     
    if nargin<2 || isempty(Fs)
        error('wrong number or types of arguments');
    end 
    
    if nargin<3
        type = 'spline';
    end
    
    RR = RR(:); 
    
    switch type
        case 'none'
            RR_rsmp = RR;
        otherwise
            if sum(isnan(RR))==0 && length(RR)>1
                ANN = cumsum(RR)-RR(1);                         
                RR_rsmp = interp1(ANN,RR,0:1/Fs:ANN(end),type); 
            else
                RR_rsmp = [];
            end
    end
    

    L = length(RR_rsmp); 
    
    if L==0 
        LFHFratio = NaN;
        LF = NaN;
        HF = NaN;
    else
        NFFT = 2^nextpow2(L);             
        Y = fft(zscore(RR_rsmp),NFFT)/L;
        f = Fs/2*linspace(0,1,NFFT/2+1);  
                                          
        YY = 2*abs(Y(1:NFFT/2+1));
        
        VLF = sum(YY(f>0.0033 & f<=0.04));
        LF = sum(YY(f>0.04 & f<=0.15));  
        HF = sum(YY(f>0.15 & f<=0.4));
        
        LFHFratio = LF/HF; 
    end
end

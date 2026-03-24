function [spc, rate] = spec(signal, t, fps)

	L = fps * t;
    
    S = zeros(size(signal,2)-L+1,L);

    for idx = 1:size(signal,2)-L+1
        p = signal(1,idx:idx+L-1);
        S(idx,:) = (p-mean(p))/(eps+std(p));
    end
    

    S = S-repmat(mean(S,2),[1,L]);
    S = S .* repmat(hann(L)',[size(S,1),1]);
    
    S = abs(fft(S,fps*60,2));
    
    spc = S(:,1:fps*60/2)';
    
    [~, rate] = max(spc,[],1);
    rate = rate - 1;
    
end


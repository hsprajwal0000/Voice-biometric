function [cfactor]=Findpeaks(x,A)
for i=1:n
    corr(i)=A(i)+max(A);
    if(x==corr(i))
        peak=corr(i);
        index=k;
    else
        peak=x;
    end
end

% scale your max amplitude to (0~1)
ampScale = 0.7;
out = zeros(s_length,1);
if max(peak) > abs(min(peak))
    out = peak*(ampScale/max(peak));
else
    out = peak*((-ampScale)/min(peak));
end


cfactor=out;
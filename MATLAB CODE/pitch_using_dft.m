function [xpitch]=pitch_using_dft(data)
Data=Window(data);
l=fft(data(:,1));
plot(real(l));
m=max(real(l));
xpitch=find(real(l)==m,1);
end
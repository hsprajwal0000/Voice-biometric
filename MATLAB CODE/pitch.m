function [out]=pitch(y,recorder,Fs)
%function is called from a main program to 
% calculatee the pitch by autocorrelation method


%collects all the reqiured data from recorder
y=getaudiodata(recorder);
sample2=recorder;
save sample2
load sample2.mat

% creating the wav format of the given function
sample2 = 'sample2.wav';
audiowrite(sample2,y,Fs);

clear y Fs

%autocorrelation method to calculate the pitch of
%the .wav format signal(audio file
[y,Fs]=audioread('sample2.wav');
y=y(:,1);
auto_corr_y=xcorr(y); 
subplot(2,1,1),plot(y) 
subplot(2,1,2),plot(auto_corr_y)
[pks,locs] = findpeaks(auto_corr_y);
[mm,peak1_ind]=max(pks);
period=locs(peak1_ind+1)-locs(peak1_ind);
pitch_Hz=Fs/period;
out=pitch_Hz;

end
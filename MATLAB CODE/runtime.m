clear all;
close all;
clc;

%recorder object
%sampling rate Fs
Fs=16000;
%mono channel with sampling rate  and 8 bit
recorder=audiorecorder(Fs,8,1);
%record users voice for 5 sec
display("please record your voice");
drawnow();

% extraction of data from the recorded audio

recordblocking(recorder,4)
display("playing")
play(recorder);
data=getaudiodata(recorder);
y=data;
plot(data)
figure;

%feature extraction process

f=pitch_using_dft(data)
T=pitch(y,recorder,Fs)



% comparing the data obtained with  registerd data files
 g=[];
load samples
  
D=[];
E=[];

%approximate logic  for detecting the user 

mini1=10000;mini2=100000;fl_1=0;fl_2=0;
for(j=1:size(F,1))
    D(j,1)=abs(F(j,1)-f);
    E(j,1)=abs(K(j,1)-T);
end

for(Q=1:size(D))
    if(D(Q,1)<mini1)
        mini1=D(Q,1);
        fl_1=Q;
    end
    
     if(E(Q,1)<mini2)
        mini2=E(Q,1);
        fl_2=Q;
    end
end   
    

 
cl=0;
if(mini1<150 && mini2>=150)
    cl=fl_1;
    
end

if(mini2<150 && mini1>=150)
     cl=fl_2;
     
end      
     
if(mini2<150 && mini1<150)
    if(fl_1==fl_2)
        cl=fl_1;
    
    else
        cl=fl_1;
        
    end
else
    display("");
    
end


if(cl==0)
    display("retry");
else
    display(C(cl))

    g=[C(cl),R(cl)];

   
end


%end of search 

% adding the data to Exel sheet
g;
    load samples
    
    G=[G;g];
    save samples F C K R it G
xlswrite('Attendance.xlsx',G)




















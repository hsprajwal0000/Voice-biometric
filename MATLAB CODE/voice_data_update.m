clear all;
close all;
clc;
%recorder object
Fs=16000;
recorder=audiorecorder(Fs,8,1);
%record users voice for 5 sec
display("please record your voice");
drawnow();


recordblocking(recorder,4)
display("playing")

play(recorder);
data=getaudiodata(recorder);
y=data;
plot(data)
figure;
%feature extraction
p=pitch_using_dft(data)
u=pitch(y,recorder,Fs)
ok=input("enter 1 to accept 0 to decline-");
if(ok==1)
 
        %save users data
        name=input("enter the name of user-");
        r=input("enter the Roll.no of user-");

        it=1;


        load samples
        G=["Name","Roll.no"];
        F(it,1)=p;
        C(it,1)=name;
        R(it,1)=r;
        K(it,1)=u;
        it=it+1;
     	save samples F C K R it G
        msgbox("voice registerd","y")
end
if(ok==0)
    msgbox("voice not registerd");
    
end
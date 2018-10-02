clear all;
dir = 'G:\My Drive\Dasgupta Research Group\Composites Subgroup\Data\Wedge Test\Yuxin\Data Processed Images\spread sheets';
filename ='20180917.xlsx';
filename = strcat(dir,'\',filename);
Data = xlsread(filename,'0910BcMat');
time = Data(5:31,2);
length = Data(5:31,3);
logtime = log(time);
fittime = min(logtime):0.3:max(logtime);
fitlength = spline(logtime,length,fittime);

plot(logtime,length,'o',fittime,fitlength);

% figure(3)
% loglog(time,length,'o',time,flength(time),'LineWidth',1);
% xlabel('time [s]');
% ylabel('crack length [mm]');
% 
% figure(4)
% loglog(fittime,fitspeed,'LineWidth',1);
% xlabel('time [s]');
% ylabel('crack length [mm/s]');
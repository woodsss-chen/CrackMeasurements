clear all;
dir = 'G:\My Drive\Dasgupta Research Group\Composites Subgroup\Data\Wedge Test\Yuxin\Data Processed Images\spread sheets';
filename ='20180917.xlsx';
filename = strcat(dir,'\',filename);
Data = xlsread(filename,'0910BcMat');
time = Data(3:31,2);
length = Data(3:31,3);
logtime = log(time);
f = fit(logtime,length,'poly5');
p = coeffvalues(f);

syms flength(x);
flength(x) = p(1)*log(x)^5 + p(2)*log(x)^4 + p(3)*log(x)^3 + p(4)*log(x)^2 + p(5)*log(x) + p(6);

syms fspeed(x);
fspeed(x) = diff(flength(x));

fittime = min(time):20:3e4;
fitspeed = double(fspeed(fittime));

figure(1)
loglog(time,length,'o',time,flength(time),'LineWidth',1);
xlabel('time [s]');
ylabel('crack length [mm]');

figure(2)
loglog(fittime,fitspeed,'LineWidth',1);
xlabel('time [s]');
ylabel('crack length [mm/s]');
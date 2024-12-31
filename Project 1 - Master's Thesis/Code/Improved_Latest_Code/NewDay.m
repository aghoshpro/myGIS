function [meanSigma1064_BScreened, meanSigma532_BTScreened, alts] = NewDay()
% Here is the file we will examine

%----- DAY DATA FEED -----%
%-----------------------------------------------------------------------------------------------------------------------------%
%filename12 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-07T13-24-55ZD.hdf';
filename13 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-09T13-12-41ZD.hdf';
filename14 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-16T13-19-24ZD.hdf';
filename15 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-23T13-25-56ZD.hdf';
filename16 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-25T13-13-42ZD.hdf';
filename17 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-01T13-20-09ZD.hdf';
filename18 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-10T13-14-13ZD.hdf';
filename19 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-24T13-26-27ZD.hdf';
filename20 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-26T13-14-04ZD.hdf';
filename21 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-07-03T13-19-56ZD.hdf';
filename22 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-07-10T13-25-48ZD.hdf';
filename23 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-07-12T13-13-19ZD.hdf';

 latMin = 37.9178;
 latMax = 41.9178;
 
 longMin = -10.1458;
 longMax = -6.1458;

%------ Calling of Function Screen ------%
%---- 532 ----%
[meanSigmaScreened13, meanSigma532_BTScreened13, meanSigma532_BPScreened13, meanSigma532_DPScreened13, alts13, numSamplesScreened13] = Screen(filename13,latMin,latMax,longMin,longMax);
[meanSigmaScreened14, meanSigma532_BTScreened14, meanSigma532_BPScreened14, meanSigma532_DPScreened14, alts14, numSamplesScreened14] = Screen(filename14,latMin,latMax,longMin,longMax);
[meanSigmaScreened15, meanSigma532_BTScreened15, meanSigma532_BPScreened15, meanSigma532_DPScreened15, alts15, numSamplesScreened15] = Screen(filename15,latMin,latMax,longMin,longMax);
[meanSigmaScreened16, meanSigma532_BTScreened16, meanSigma532_BPScreened16, meanSigma532_DPScreened16, alts16, numSamplesScreened16] = Screen(filename16,latMin,latMax,longMin,longMax);
[meanSigmaScreened17, meanSigma532_BTScreened17, meanSigma532_BPScreened17, meanSigma532_DPScreened17, alts17, numSamplesScreened17] = Screen(filename17,latMin,latMax,longMin,longMax);
[meanSigmaScreened18, meanSigma532_BTScreened18, meanSigma532_BPScreened18, meanSigma532_DPScreened18, alts18, numSamplesScreened18] = Screen(filename18,latMin,latMax,longMin,longMax);
[meanSigmaScreened19, meanSigma532_BTScreened19, meanSigma532_BPScreened19, meanSigma532_DPScreened19, alts19, numSamplesScreened19] = Screen(filename19,latMin,latMax,longMin,longMax);
[meanSigmaScreened20, meanSigma532_BTScreened20, meanSigma532_BPScreened20, meanSigma532_DPScreened20, alts20, numSamplesScreened20] = Screen(filename20,latMin,latMax,longMin,longMax);
[meanSigmaScreened21, meanSigma532_BTScreened21, meanSigma532_BPScreened21, meanSigma532_DPScreened21, alts21, numSamplesScreened21] = Screen(filename21,latMin,latMax,longMin,longMax);
[meanSigmaScreened22, meanSigma532_BTScreened22, meanSigma532_BPScreened22, meanSigma532_DPScreened22, alts22, numSamplesScreened22] = Screen(filename22,latMin,latMax,longMin,longMax);
[meanSigmaScreened23, meanSigma532_BTScreened23, meanSigma532_BPScreened23, meanSigma532_DPScreened23, alts23, numSamplesScreened23] = Screen(filename23,latMin,latMax,longMin,longMax);

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%
%---- 1064 ----%
[meanSigma1064Screened13, meanSigma1064_BScreened13, alts13, numSamples1064Screened13] = Screen1064(filename13,latMin,latMax,longMin,longMax);
[meanSigma1064Screened14, meanSigma1064_BScreened14, alts14, numSamples1064Screened14] = Screen1064(filename14,latMin,latMax,longMin,longMax);
[meanSigma1064Screened15, meanSigma1064_BScreened15, alts15, numSamples1064Screened15] = Screen1064(filename15,latMin,latMax,longMin,longMax);
[meanSigma1064Screened16, meanSigma1064_BScreened16, alts16, numSamples1064Screened16] = Screen1064(filename16,latMin,latMax,longMin,longMax);
[meanSigma1064Screened17, meanSigma1064_BScreened17, alts17, numSamples1064Screened17] = Screen1064(filename17,latMin,latMax,longMin,longMax);
[meanSigma1064Screened18, meanSigma1064_BScreened18, alts18, numSamples1064Screened18] = Screen1064(filename18,latMin,latMax,longMin,longMax);
[meanSigma1064Screened19, meanSigma1064_BScreened19, alts19, numSamples1064Screened19] = Screen1064(filename19,latMin,latMax,longMin,longMax);
[meanSigma1064Screened20, meanSigma1064_BScreened20, alts20, numSamples1064Screened20] = Screen1064(filename20,latMin,latMax,longMin,longMax);
[meanSigma1064Screened21, meanSigma1064_BScreened21, alts21, numSamples1064Screened21] = Screen1064(filename21,latMin,latMax,longMin,longMax);
[meanSigma1064Screened22, meanSigma1064_BScreened22, alts22, numSamples1064Screened22] = Screen1064(filename22,latMin,latMax,longMin,longMax);
[meanSigma1064Screened23, meanSigma1064_BScreened23, alts23, numSamples1064Screened23] = Screen1064(filename23,latMin,latMax,longMin,longMax);

%-----------------------------------------------------------------------------------------------------------------------%

%--- COLOR RATIO DAY ------------------------------------------------------
subplot(1,2,2)
%plot(meanSigmaScreened12,alts12,'linewidth',2,'color','red')
hold on
plot(meanSigma1064_BScreened13./meanSigma532_BTScreened13,alts13,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma1064_BScreened14./meanSigma532_BTScreened14,alts14,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma1064_BScreened15./meanSigma532_BTScreened15,alts15,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma1064_BScreened16./meanSigma532_BTScreened16,alts16,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigma1064_BScreened17./meanSigma532_BTScreened17,alts17,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma1064_BScreened18./meanSigma532_BTScreened18,alts18,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(meanSigma1064_BScreened19./meanSigma532_BTScreened19,alts19,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma1064_BScreened20./meanSigma532_BTScreened20,alts20,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma1064_BScreened21./meanSigma532_BTScreened21,alts21,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma1064_BScreened22./meanSigma532_BTScreened22,alts22,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on
plot(meanSigma1064_BScreened23./meanSigma532_BTScreened23,alts23,'linewidth',2,'color','[0.6 0.6 0]') %slimy green
hold on

set(gca,'xlim',[0 6])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('Color Ratio [DAY TIME]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','01-06-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on


%--- DEPOLARIZATIION DAY ------------------------------------------------------

% subplot(1,2,2)
% % plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
% hold on
% plot(meanSigma532_DPScreened13,alts13,'linewidth',2,'color','red','linestyle','--')
% hold on
% plot(meanSigma532_DPScreened14,alts14,'linewidth',2,'color','blue','linestyle','--')
% hold on
% plot(meanSigma532_DPScreened15,alts15,'linewidth',2,'color','green','linestyle','--')
% hold on
% plot(meanSigma532_DPScreened16,alts16,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
% hold on
% plot(meanSigma532_DPScreened17,alts17,'linewidth',2,'color','cyan','linestyle','--')
% hold on
% plot(meanSigma532_DPScreened18,alts18,'linewidth',2,'color',' [1 0.4 0.6]')
% hold on
% plot(meanSigma532_DPScreened19,alts19,'linewidth',2,'color','[0.9 0.5 0]')%Orange
% hold on
% plot(meanSigma532_DPScreened20,alts20,'linewidth',2,'color','[0.4 0.1 0]')%Brown
% hold on
% plot(meanSigma532_DPScreened21,alts21,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
% hold on
% plot(meanSigma532_DPScreened22,alts23,'linewidth',2,'color','[0 0.5 1]') %indigo
% hold on
% plot(meanSigma532_DPScreened23,alts23,'linewidth',2,'color','[0.6 0.6 0]') %slimy green
% hold on
% 
% set(gca,'xlim',[0 1])
% set(gca,'ylim',[0 5])
% ylabel('Altitude (km)')
% xlabel('Mean sigma (km^{-1})')
% title('Depolarization Ratio Profile 532nm [DAY TIME]')
% legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','01-06-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
% grid on
% 

end
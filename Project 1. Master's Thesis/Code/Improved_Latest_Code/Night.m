% Here is the file we will examine

%----- NIGHT DATA FEED -----%
%-----------------------------------------------------------------------------------------------------------------------------%
%filename01 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-07T02-45-04ZN.hdf';
filename02 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-09T02-32-50ZN.hdf';
filename03 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-16T02-39-32ZN.hdf';
filename04 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-23T02-46-10ZN.hdf';
filename05 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-05-25T02-33-51ZN.hdf';
filename06 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-10T02-34-22ZN.hdf';
filename07 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-24T02-46-36ZN.hdf';
filename08 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-06-26T02-34-12ZN.hdf';
filename09 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-07-03T02-40-04ZN.hdf';
filename10 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-07-10T02-45-57ZN.hdf';
filename11 = 'CAL_LID_L2_05kmAPro-Standard-V4-10.2017-07-12T02-33-28ZN.hdf';
%-----------------------------------------------------------------------------------------------------------------------------%
 latMin = 37.9178;
 latMax = 41.9178;
 
 longMin = -10.1458;
 longMax = -6.1458;

%------ Calling of Function Screen ------%
% [meanSigmaScreened01, alts01, numSamplesScreened01] = Screen(filename01,latMin,latMax,longMin,longMax);
[meanSigmaScreened02, meanSigma532_BTScreened02, meanSigma532_BPScreened02, meanSigma532_DPScreened02, alts02, numSamplesScreened02] = Screen(filename02,latMin,latMax,longMin,longMax);
[meanSigmaScreened03, meanSigma532_BTScreened03, meanSigma532_BPScreened03, meanSigma532_DPScreened03, alts03, numSamplesScreened03] = Screen(filename03,latMin,latMax,longMin,longMax);
[meanSigmaScreened04, meanSigma532_BTScreened04, meanSigma532_BPScreened04, meanSigma532_DPScreened04, alts04, numSamplesScreened04] = Screen(filename04,latMin,latMax,longMin,longMax);
[meanSigmaScreened05, meanSigma532_BTScreened05, meanSigma532_BPScreened05, meanSigma532_DPScreened05, alts05, numSamplesScreened05] = Screen(filename05,latMin,latMax,longMin,longMax);
[meanSigmaScreened06, meanSigma532_BTScreened06, meanSigma532_BPScreened06, meanSigma532_DPScreened06, alts06, numSamplesScreened06] = Screen(filename06,latMin,latMax,longMin,longMax);
[meanSigmaScreened07, meanSigma532_BTScreened07, meanSigma532_BPScreened07, meanSigma532_DPScreened07, alts07, numSamplesScreened07] = Screen(filename07,latMin,latMax,longMin,longMax);
[meanSigmaScreened08, meanSigma532_BTScreened08, meanSigma532_BPScreened08, meanSigma532_DPScreened08, alts08, numSamplesScreened08] = Screen(filename08,latMin,latMax,longMin,longMax);
[meanSigmaScreened09, meanSigma532_BTScreened09, meanSigma532_BPScreened09, meanSigma532_DPScreened09, alts09, numSamplesScreened09] = Screen(filename09,latMin,latMax,longMin,longMax);
[meanSigmaScreened10, meanSigma532_BTScreened10, meanSigma532_BPScreened10, meanSigma532_DPScreened10, alts10, numSamplesScreened10] = Screen(filename10,latMin,latMax,longMin,longMax);
[meanSigmaScreened11, meanSigma532_BTScreened11, meanSigma532_BPScreened11, meanSigma532_DPScreened11, alts11, numSamplesScreened11] = Screen(filename11,latMin,latMax,longMin,longMax);
%  
% NewDay()
% [meanSigmaScreened13, meanSigma532_BTScreened13, meanSigma532_BPScreened13, meanSigma532_DPScreened13, alts13, numSamplesScreened13] = Screen(filename13,latMin,latMax,longMin,longMax);
% [meanSigmaScreened14, meanSigma532_BTScreened14, meanSigma532_BPScreened14, meanSigma532_DPScreened14, alts14, numSamplesScreened14] = Screen(filename14,latMin,latMax,longMin,longMax);
% [meanSigmaScreened15, meanSigma532_BTScreened15, meanSigma532_BPScreened15, meanSigma532_DPScreened15, alts15, numSamplesScreened15] = Screen(filename15,latMin,latMax,longMin,longMax);
% [meanSigmaScreened16, meanSigma532_BTScreened16, meanSigma532_BPScreened16, meanSigma532_DPScreened16, alts16, numSamplesScreened16] = Screen(filename16,latMin,latMax,longMin,longMax);
% [meanSigmaScreened17, meanSigma532_BTScreened17, meanSigma532_BPScreened17, meanSigma532_DPScreened17, alts17, numSamplesScreened17] = Screen(filename17,latMin,latMax,longMin,longMax);
% [meanSigmaScreened18, meanSigma532_BTScreened18, meanSigma532_BPScreened18, meanSigma532_DPScreened18, alts18, numSamplesScreened18] = Screen(filename18,latMin,latMax,longMin,longMax);
% [meanSigmaScreened19, meanSigma532_BTScreened19, meanSigma532_BPScreened19, meanSigma532_DPScreened19, alts19, numSamplesScreened19] = Screen(filename19,latMin,latMax,longMin,longMax);
% [meanSigmaScreened20, meanSigma532_BTScreened20, meanSigma532_BPScreened20, meanSigma532_DPScreened20, alts20, numSamplesScreened20] = Screen(filename20,latMin,latMax,longMin,longMax);
% [meanSigmaScreened21, meanSigma532_BTScreened21, meanSigma532_BPScreened21, meanSigma532_DPScreened21, alts21, numSamplesScreened21] = Screen(filename21,latMin,latMax,longMin,longMax);
% [meanSigmaScreened22, meanSigma532_BTScreened22, meanSigma532_BPScreened22, meanSigma532_DPScreened22, alts22, numSamplesScreened22] = Screen(filename22,latMin,latMax,longMin,longMax);
% [meanSigmaScreened23, meanSigma532_BTScreened23, meanSigma532_BPScreened23, meanSigma532_DPScreened23, alts23, numSamplesScreened23] = Screen(filename23,latMin,latMax,longMin,longMax);

%--- 1064 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%
[meanSigma1064Screened02, meanSigma1064_BScreened02, alts02, numSamples1064Screened02] = Screen1064(filename02,latMin,latMax,longMin,longMax);
[meanSigma1064Screened03, meanSigma1064_BScreened03, alts03, numSamples1064Screened03] = Screen1064(filename03,latMin,latMax,longMin,longMax);
[meanSigma1064Screened04, meanSigma1064_BScreened04, alts04, numSamples1064Screened04] = Screen1064(filename04,latMin,latMax,longMin,longMax);
[meanSigma1064Screened05, meanSigma1064_BScreened05, alts05, numSamples1064Screened05] = Screen1064(filename05,latMin,latMax,longMin,longMax);
[meanSigma1064Screened06, meanSigma1064_BScreened06, alts06, numSamples1064Screened06] = Screen1064(filename06,latMin,latMax,longMin,longMax);
[meanSigma1064Screened07, meanSigma1064_BScreened07, alts07, numSamples1064Screened07] = Screen1064(filename07,latMin,latMax,longMin,longMax);
[meanSigma1064Screened08, meanSigma1064_BScreened08, alts08, numSamples1064Screened08] = Screen1064(filename08,latMin,latMax,longMin,longMax);
[meanSigma1064Screened09, meanSigma1064_BScreened09, alts09, numSamples1064Screened09] = Screen1064(filename09,latMin,latMax,longMin,longMax);
[meanSigma1064Screened10, meanSigma1064_BScreened10, alts10, numSamples1064Screened10] = Screen1064(filename10,latMin,latMax,longMin,longMax);
[meanSigma1064Screened11, meanSigma1064_BScreened11, alts11, numSamples1064Screened11] = Screen1064(filename11,latMin,latMax,longMin,longMax);

% -- 5. Total Plot of Graphs -- %

% -- Night Data Feed 532 -- %
%---------------------------------------------------------------------------------------------------------------------------------%
figure
subplot(1,2,1)
% plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(meanSigmaScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigmaScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigmaScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigmaScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigmaScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigmaScreened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(meanSigmaScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigmaScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigmaScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigmaScreened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on

set(gca,'xlim',[0 0.15])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('CALIPSO Mean Extinction Coefficient 532nm [Night Time]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on


subplot(1,2,2)
%plot(numSamplesScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(numSamplesScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(numSamplesScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(numSamplesScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(numSamplesScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(numSamplesScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(numSamplesScreened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(numSamplesScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(numSamplesScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(numSamplesScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(numSamplesScreened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on


set(gca,'xlim',[0 70])
set(gca,'ylim',[0 5])

xlabel('Number')
title('Number of Samples(Screened)')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on

%---- Depolarization Ratio Profile ----%
%---------------------------------------------------------------------------------------------------------------%
figure
subplot(1,2,1)
% plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(meanSigma532_DPScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma532_DPScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma532_DPScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma532_DPScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigma532_DPScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma532_DPScreened07,alts07,'linewidth',2,'color','[1 0.4 0.6]')
hold on
plot(meanSigma532_DPScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma532_DPScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma532_DPScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma532_DPScreened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on

set(gca,'xlim',[0 1])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('Depolarization Ratio Profile 532nm [Night Time]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on

NewDay()
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

% set(gca,'xlim',[0 1])
% set(gca,'ylim',[0 5])
% ylabel('Altitude (km)')
% xlabel('Mean sigma (km^{-1})')
% title('Depolarization Ratio Profile 532nm [DAY TIME]')
% legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','01-06-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
% grid on

% -- Night Data Feed 1064 -- %
%---------------------------------------------------------------------------------------------------------------------------------%

figure
subplot(1,2,1)
% plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(meanSigma1064Screened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma1064Screened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma1064Screened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma1064Screened05,alts05,'linewidth',2,'color','[0.9 0.7 0]')%Gold
hold on
plot(meanSigma1064Screened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma1064Screened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]') %Pink
hold on
plot(meanSigma1064Screened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma1064Screened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma1064Screened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma1064Screened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on

set(gca,'xlim',[0 0.15])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('CALIPSO Mean Extinction Coefficient 1064nm [Night Time]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on


subplot(1,2,2)
%plot(numSamplesScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(numSamples1064Screened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(numSamples1064Screened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(numSamples1064Screened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(numSamples1064Screened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(numSamples1064Screened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(numSamples1064Screened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(numSamples1064Screened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(numSamples1064Screened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(numSamples1064Screened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(numSamples1064Screened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on


set(gca,'xlim',[0 70])
set(gca,'ylim',[0 5])

xlabel('Number')
title('Number of Samples(Screened)')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on

%-------- BACKSCATTER COEFFICIENT 532nm ------------------------------------------------------------------------------------------------
figure
subplot(1,3,1)
% plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(meanSigma532_BTScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma532_BTScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma532_BTScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma532_BTScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigma532_BTScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma532_BTScreened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(meanSigma532_BTScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma532_BTScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma532_BTScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma532_BTScreened11,alts11,'linewidth',2,'color','[0.6 0.6 0]') %slimy green
hold on

set(gca,'xlim',[0 0.001])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('TOTAL 532nm [Night Time]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on


subplot(1,3,2)
% plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(meanSigma532_BPScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma532_BPScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma532_BPScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma532_BPScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigma532_BPScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma532_BPScreened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(meanSigma532_BPScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma532_BPScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma532_BPScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma532_BPScreened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on

set(gca,'xlim',[0 0.001])
set(gca,'ylim',[0 5])
xlabel('Mean sigma (km^{-1})')
title('PARPENDICULAR 532nm [Night Time]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on


subplot(1,3,3)
% plot(meanSigmaScreened01,alts01,'linewidth',2,'color','red')
hold on
plot(meanSigma532_BTScreened02-meanSigma532_BPScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma532_BTScreened03-meanSigma532_BPScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma532_BTScreened04-meanSigma532_BPScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma532_BTScreened05-meanSigma532_BPScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigma532_BTScreened06-meanSigma532_BPScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma532_BTScreened07-meanSigma532_BPScreened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(meanSigma532_BTScreened08-meanSigma532_BPScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma532_BTScreened09-meanSigma532_BPScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma532_BTScreened10-meanSigma532_BPScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma532_BTScreened11-meanSigma532_BPScreened11,alts11,'linewidth',2,'color','[0.6 0.6 0]') %slimy green
hold on

set(gca,'xlim',[0 0.001])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('PARALLEL 532nm [Night Time]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on

%------ COLOR RATIO --------------------------------------------------------------------------------------
figure
subplot(1,2,1)
%plot(meanSigmaScreened12,alts12,'linewidth',2,'color','red')
hold on
plot(meanSigma1064_BScreened02./meanSigma532_BTScreened02,alts02,'linewidth',2,'color','red','linestyle','--')
hold on
plot(meanSigma1064_BScreened03./meanSigma532_BTScreened03,alts03,'linewidth',2,'color','blue','linestyle','--')
hold on
plot(meanSigma1064_BScreened04./meanSigma532_BTScreened04,alts04,'linewidth',2,'color','green','linestyle','--')
hold on
plot(meanSigma1064_BScreened05./meanSigma532_BTScreened05,alts05,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
hold on
plot(meanSigma1064_BScreened06./meanSigma532_BTScreened06,alts06,'linewidth',2,'color','cyan','linestyle','--')
hold on
plot(meanSigma1064_BScreened07./meanSigma532_BTScreened07,alts07,'linewidth',2,'color',' [1 0.4 0.6]')
hold on
plot(meanSigma1064_BScreened08./meanSigma532_BTScreened08,alts08,'linewidth',2,'color','[0.9 0.5 0]')%Orange
hold on
plot(meanSigma1064_BScreened09./meanSigma532_BTScreened09,alts09,'linewidth',2,'color','[0.4 0.1 0]')%Brown
hold on
plot(meanSigma1064_BScreened10./meanSigma532_BTScreened10,alts10,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
hold on
plot(meanSigma1064_BScreened11./meanSigma532_BTScreened11,alts11,'linewidth',2,'color','[0 0.5 1]') %indigo
hold on

set(gca,'xlim',[0 6])
set(gca,'ylim',[0 5])
ylabel('Altitude (km)')
xlabel('Mean sigma (km^{-1})')
title('Color Ratio [NIGHT TIME]')
legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
grid on


NewDay() %function call
% subplot(1,2,2)
% %plot(meanSigmaScreened12,alts12,'linewidth',2,'color','red')
% hold on
% plot(meanSigma1064_BScreened13./meanSigma532_BTScreened13,alts13,'linewidth',2,'color','red','linestyle','--')
% hold on
% plot(meanSigma1064_BScreened14./meanSigma532_BTScreened14,alts14,'linewidth',2,'color','blue','linestyle','--')
% hold on
% plot(meanSigma1064_BScreened15./meanSigma532_BTScreened15,alts15,'linewidth',2,'color','green','linestyle','--')
% hold on
% plot(meanSigma1064_BScreened16./meanSigma532_BTScreened16,alts16,'linewidth',2,'color','[0.9 0.7 0]','linestyle','--')%Gold
% hold on
% plot(meanSigma1064_BScreened17./meanSigma532_BTScreened17,alts17,'linewidth',2,'color','cyan','linestyle','--')
% hold on
% plot(meanSigma1064_BScreened18./meanSigma532_BTScreened18,alts18,'linewidth',2,'color',' [1 0.4 0.6]')
% hold on
% plot(meanSigma1064_BScreened19./meanSigma532_BTScreened19,alts19,'linewidth',2,'color','[0.9 0.5 0]')%Orange
% hold on
% plot(meanSigma1064_BScreened20./meanSigma532_BTScreened20,alts20,'linewidth',2,'color','[0.4 0.1 0]')%Brown
% hold on
% plot(meanSigma1064_BScreened21./meanSigma532_BTScreened21,alts21,'linewidth',2,'color','[0.8 0.6 0.8]')%Light Magenta
% hold on
% plot(meanSigma1064_BScreened22./meanSigma532_BTScreened22,alts22,'linewidth',2,'color','[0 0.5 1]') %indigo
% hold on
% plot(meanSigma1064_BScreened23./meanSigma532_BTScreened23,alts23,'linewidth',2,'color','[0.6 0.6 0]') %slimy green
% hold on
% 
% set(gca,'xlim',[0 6])
% set(gca,'ylim',[0 5])
% ylabel('Altitude (km)')
% xlabel('Mean sigma (km^{-1})')
% title('Color Ratio [DAY TIME]')
% legend('09-05-2017','16-05-2017','23-05-2017','25-05-2017','01-06-2017','10-06-2017','24-06-2017','26-06-2017','03-07-2017','10-07-2017','12-07-2017')
% grid on
% 

%---------------------------------------------------------------------------------------------------------------------------------%
%---------------------------------------------------------------------------------------------------------------------------------%
%---------------------------------------------------------------------------------------------------------------------------------%

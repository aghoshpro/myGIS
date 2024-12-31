clear;
List_of_Files = dir('*.tif');
for i = 1:length(List_of_Files)
   
  [A,R] = geotiffread(List_of_Files(i).name);
  index = find(A <= min(min(A))); % Null value = -3.399999952144364e+38
  A(index) = NaN;
  
  Mean(i) = nanmean(nanmean(A));
  
  
end
Year = 1:length(List_of_Files); 

Date = yyyymmdd(datetime(2003,01,01) + calmonths(0:191));
D = string(Date);
D = char(D);

Date_New = datetime(2003,1,1) + calmonths(0:(length(Date) - 1));

% fig03 = figure('units','normalized','outerposition',[0 0 1 1]);
% plot(Date_New,Mean,'linewidth',2,'color','blue');%,'Marker','o','MarkerFaceColor','r')
% hold on
% % plot(T,CWS,'linewidth',2,'color',[0 0.6 0],'Marker','s','MarkerFaceColor','k')
% % hold on
% % plot(T,SMC,'linewidth',2,'color',[1 0.7 0],'Marker','s','MarkerFaceColor','k')
% % hold on
% % plot(T,TRMM,'linewidth',2,'color','blue','Marker','x','MarkerFaceColor','b')
% % hold on
% 
% grid on
% % xticks(Year)
% % xticklabels({'2002','.','.','.','.','.','.','.','.','.','.','.','2003','2','3','4','5','6','7','8','9','10','11','12','2004','2','3','4','5','6','7','8','9','10','11','12','2005','2','3','4','5','6','7','8','9','10','11','12','2006','2','3','4','5','6','7','8','9','10','11','12','2007','2','3','4','5','6','7','8','9','10','11','12','2008','2','3','4','5','6','7','8','9','10','11','12','2009','2','3','4','5','6','7','8','9','10','11','12','2010','2','3','4','5','6','7','8','9','10','11','12','2011','2','3','4','5','6','7','8','9','10','11','12','2012','2','3','4','5','6','7','8','9','10','11','12','2013','2','3','4','5','6','7','8','9','10','11','12','2014','2','3','4','5','6','7','8','9','10','11','12','2015','2','3','4','5','6','7','8','9','10','11','12','2016','2','3','4','5','6','7','8','9','10','11','12','2017','2','3','4','5','6','7','8','9','10','11','12','2018'})
% 
% ylabel('Monthly Mean Sea Level(mm)')
% %ylim([0.1 0.7])
% %xlim([Date_New(1) Date_New(192)])
% xlabel('Years')

Destination = 'C:\Users\ARKA GHOSH\Desktop\Project 2\All Outputs\';  %Savefile
filename01 = 'ARA_SST_16Y_Mean.csv';
csvwrite(strcat(Destination,filename01),Mean);
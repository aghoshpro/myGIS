clear;
List_of_Files = dir('*.xlsx');

Karachi = xlsread(List_of_Files(1).name);
Kochi = xlsread(List_of_Files(2).name);
Masirah = xlsread(List_of_Files(3).name);
Mumbai = xlsread(List_of_Files(4).name);

Year_C = Karachi(:,1);
Year_V = Kochi(:,1);
Year_S = Mumbai(:,1);
Year_P = Masirah(:,1);

MSL_C =  Karachi(:,3);
MSL_V =  Kochi(:,3);
MSL_S =  Mumbai(:,3);
MSL_P =  Masirah(:,3);

index_C = find(MSL_C <= min(MSL_C));  %Null value = -3.399999952144364e+38
MSL_C(index_C) = NaN;

index_V = find(MSL_V <= min(MSL_V));  %Null value = -3.399999952144364e+38
MSL_V(index_V) = NaN;

index_S = find(MSL_S <= min(MSL_S));  %Null value = -3.399999952144364e+38
MSL_S(index_S) = NaN;

index_P = find(MSL_P <= min(MSL_P));  %Null value = -3.399999952144364e+38
MSL_P(index_P) = NaN;

tC = datetime(Year_C(1),1,1) + calmonths(0:(length(MSL_C) - 1)); %0:1210
tV = datetime(Year_V(1),1,1) + calmonths(0:(length(MSL_V) - 1)); %0:899
tS = datetime(Year_S(1),1,1) + calmonths(0:(length(MSL_S) - 1)); %0:1606
tP = datetime(Year_P(1),1,1) + calmonths(0:(length(MSL_P) - 1)); %0:240

fig03 = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
plot(tC,MSL_C,'linewidth',1,'color','blue');%,'Marker','*','MarkerEdgeColor','r')
hold on
% [p,~,mu] = polyfit(datenum(tC),MSL_C,1);
% f = polyval(p,datenum(tC),[],mu);
% hold on
% plot(tC,f,'linewidth',1,'color','k')
grid on
legend('Kochi (PAK) MSL');
ylabel('Monthly Mean Sea Level(mm)')
title('Kochi MSL','Interpreter', 'none', ...
       'FontSize',12, 'FontWeight','bold');

xlabel('Years')

subplot(2,2,2)
plot(tV,MSL_V,'linewidth',1,'color',[0 0.6 0]);%,'Marker','s','MarkerEdgeColor','k')
hold on
% [p,~,mu] = polyfit(Year_V,MSL_V,1);
% f = polyval(p,Year_V,[],mu);
% hold on
% plot(Year_V,f,'linewidth',1,'color','k')
grid on
legend('Kochi MSL');

title('Kochi MSL','Interpreter', 'none', ...
       'FontSize',12, 'FontWeight','bold');
grid on
ylabel('Monthly Mean Sea Level(mm)')
xlabel('Years')

subplot(2,2,3)
plot(tS,MSL_S,'linewidth',1,'color',[1 0.7 0]);%,'Marker','*','MarkerEdgeColor','r')
hold on
% [p,~,mu] = polyfit(Year_S,MSL_S,1);
% f = polyval(p,Year_S,[],mu);
% hold on
% plot(Year_S,f,'linewidth',1,'color','k')
grid on

ylabel('Monthly Mean Sea Level(mm)')
title('Mumbai','Interpreter', 'none', ...
       'FontSize',12, 'FontWeight','bold');
xlabel('Years')
ylabel('Mean Sea Level(mm)')
legend('Sagar MSL');

subplot(2,2,4)
plot(tP,MSL_P,'linewidth',1,'color','red');%,'Marker','*','MarkerEdgeColor','r')
hold on
dnv = datenum(tP);
% [p,~,mu] = polyfit(Year_P,MSL_P,1);
% f = polyval(p,Year_P,[],mu);
% hold on
% plot(Year_P,f,'linewidth',1,'color','k')
grid on
title('Masirah MSL','Interpreter', 'none', ...
       'FontSize',12, 'FontWeight','bold');
xlabel('Years')
ylabel('Monthly Mean Sea Level(mm)')
legend('Masirah MSL');%,'GLDAS SMC','TRMM Pr','Location','best','Orientation','Horizontal')



suptitle('Arabian Sea MSL');%,'FontSize',16,'FontWeight','bold');
sup.FontSize = 20;
% sgt = sgtitle('MSL of Bay of Bengal','Color','red');
% sgt.FontSize = 20;

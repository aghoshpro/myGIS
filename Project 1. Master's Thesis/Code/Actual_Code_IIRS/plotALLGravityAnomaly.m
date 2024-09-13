Main = dir('*.tif');
Years = dir('*.tif');
l =length(Main(1).name);
%v = str2num(Years);

for i = 1:length(Main)
        v(i) = str2num(extractBefore(Main(i).name,5));
end 

V = unique(v);

for i = 1:length(V)
%         list{i} = dir('20ii_*.tif_sf.tif');
%         [M1(i)] = MonthlyGA(Main(i));
  T(i) = i;
end 
%--------------------------------------------------------------------------
list01 = dir('2002_*.tif_sf.tif');
%[M1(1)] = MonthlyGA(list01);
%[K1(1),K2(1),Z{1}] = DataXtractlonglat(list01); 

[K1(1),K2(1),Zk{1}] = Kashmir(list01);
[H1(1),H2(1),Zh{1}] = Himachal(list01);
[U1(1),U2(1),Zu{1}] = Uttarakhand(list01);
%--------------------------------------------------------------------------
list02 = dir('*03_*.tif_sf.tif');
% [M1(2)] = MonthlyGA(list02);
%[K1(2),K2(2),Z{2}] = DataXtractlonglat(list02); 

[K1(2),K2(2),Zk{2}] = Kashmir(list02);
[H1(2),H2(2),Zh{2}] = Himachal(list02);
[U1(2),U2(2),Zu{2}] = Uttarakhand(list02);
%--------------------------------------------------------------------------
list03 = dir('*04_*.tif_sf.tif');
% [M1(3)] = MonthlyGA(list03);
%[K1(3),K2(3),Z{3}] = DataXtractlonglat(list03); 

[K1(3),K2(3),Zk{3}] = Kashmir(list03);
[H1(3),H2(3),Zh{3}] = Himachal(list03);
[U1(3),U2(3),Zu{3}] = Uttarakhand(list03);
%--------------------------------------------------------------------------
list04 = dir('*05_*.tif_sf.tif');
% [M1(4)] = MonthlyGA(list04);
%[K1(4),K2(4),Z{4}] = DataXtractlonglat(list04); 

[K1(4),K2(4),Zk{4}] = Kashmir(list04);
[H1(4),H2(4),Zh{4}] = Himachal(list04);
[U1(4),U2(4),Zu{4}] = Uttarakhand(list04);
%--------------------------------------------------------------------------
list05 = dir('*06_*.tif_sf.tif');
% [M1(5)] = MonthlyGA(list05);
%[K1(5),K2(5),Z{5}] = DataXtractlonglat(list05); 

[K1(5),K2(5),Zk{5}] = Kashmir(list05);
[H1(5),H2(5),Zh{5}] = Himachal(list05);
[U1(5),U2(5),Zu{5}] = Uttarakhand(list05);
%--------------------------------------------------------------------------
list06 = dir('*07_*.tif_sf.tif');
% [M1(6)] = MonthlyGA(list06);
%[K1(6),K2(6),Z{6}] = DataXtractlonglat(list06);

[K1(6),K2(6),Zk{6}] = Kashmir(list06);
[H1(6),H2(6),Zh{6}] = Himachal(list06);
[U1(6),U2(6),Zu{6}] = Uttarakhand(list06);
%--------------------------------------------------------------------------
list07 = dir('*08_*.tif_sf.tif');
% [M1(7)] = MonthlyGA(list07);
%[K1(7),K2(7),Z{7}] = DataXtractlonglat(list07);

[K1(7),K2(7),Zk{7}] = Kashmir(list07);
[H1(7),H2(7),Zh{7}] = Himachal(list07);
[U1(7),U2(7),Zu{7}] = Uttarakhand(list07);
%--------------------------------------------------------------------------
list08 = dir('*2009_*.tif_sf.tif');
% [M1(8)] = MonthlyGA(list08);
%[K1(8),K2(8),Z{8}] = DataXtractlonglat(list08);

[K1(8),K2(8),Zk{8}] = Kashmir(list08);
[H1(8),H2(8),Zh{8}] = Himachal(list08);
[U1(8),U2(8),Zu{8}] = Uttarakhand(list08);
%-------------------------------------------------------------------------- 
list09 = dir('*2010_*.tif_sf.tif');
% [M1(9)] = MonthlyGA(list09);
%[K1(9),K2(9),Z{9}] = DataXtractlonglat(list09);

[K1(9),K2(9),Zk{9}] = Kashmir(list09);
[H1(9),H2(9),Zh{9}] = Himachal(list09);
[U1(9),U2(9),Zu{9}] = Uttarakhand(list09);
%--------------------------------------------------------------------------  
list10 = dir('*2011_*.tif_sf.tif');
% [M1(10)] = MonthlyGA(list10);
%[K1(10),K2(10),Z{10}] = DataXtractlonglat(list10);

[K1(10),K2(10),Zk{10}] = Kashmir(list10);
[H1(10),H2(10),Zh{10}] = Himachal(list10);
[U1(10),U2(10),Zu{10}] = Uttarakhand(list10);
%--------------------------------------------------------------------------
list11 = dir('*2012_*.tif_sf.tif');
% [M1(11)] = MonthlyGA(list11);
%[K1(11),K2(11),Z{11}] = DataXtractlonglat(list11);

[K1(11),K2(11),Zk{11}] = Kashmir(list11);
[H1(11),H2(11),Zh{11}] = Himachal(list11);
[U1(11),U2(11),Zu{11}] = Uttarakhand(list11);
%--------------------------------------------------------------------------
list12 = dir('*2013_*.tif_sf.tif');
% [M1(12)] = MonthlyGA(list12);
%[K1(12),K2(12),Z{12}] = DataXtractlonglat(list12); 

[K1(12),K2(12),Zk{12}] = Kashmir(list12);
[H1(12),H2(12),Zh{12}] = Himachal(list12);
[U1(12),U2(12),Zu{12}] = Uttarakhand(list12);
%-------------------------------------------------------------------------- 
list13 = dir('*2014_*.tif_sf.tif');
% % [M1(13)] = MonthlyGA(list13);
%[K1(13),K2(13),Z{13}] = DataXtractlonglat(list13);

[K1(13),K2(13),Zk{13}] = Kashmir(list13);
[H1(13),H2(13),Zh{13}] = Himachal(list13);
[U1(13),U2(13),Zu{13}] = Uttarakhand(list13);
%--------------------------------------------------------------------------
 list14 = dir('*2015_*.tif_sf.tif');
% % [M1(14)] = MonthlyGA(list14);
%[K1(14),K2(14),Z{14}] = DataXtractlonglat(list14);
 
[K1(14),K2(14),Zk{14}] = Kashmir(list14);
[H1(14),H2(14),Zh{14}] = Himachal(list14);
[U1(14),U2(14),Zu{14}] = Uttarakhand(list14);
%-------------------------------------------------------------------------- 
list15 = dir('*2016_*.tif_sf.tif');
% % [M1(15)] = MonthlyGA(list15);
%[K1(15),K2(15),Z{15}] = DataXtractlonglat(list15);

[K1(15),K2(15),Zk{15}] = Kashmir(list15);
[H1(15),H2(15),Zh{15}] = Himachal(list15);
[U1(15),U2(15),Zu{15}] = Uttarakhand(list15);
%--------------------------------------------------------------------------
list16 = dir('*2017_*.tif_sf.tif');
% [M1(16)] = MonthlyGA(list16);
%[K1(16),K2(16),Z{16}] = DataXtractlonglat(list16); 

[K1(16),K2(16),Zk{16}] = Kashmir(list16);
[H1(16),H2(16),Zh{16}] = Himachal(list16);
[U1(16),U2(16),Zu{16}] = Uttarakhand(list16);
%--------------------------------------------------------------------------


% fig01 = figure('units','normalized','outerposition',[0 0 1 1]);
% plot(T,M1,'linewidth',2,'color','red')
% % errorbar(T,Ymean,S,'-o','MarkerSize',5,...
% %     'MarkerEdgeColor','black','MarkerFaceColor','red')
% hold on
% grid on;
% 
% for i = 1:length(V)
% text(T(i),M1(i),num2str(   M1(i)),'VerticalAlignment','bottom');
% end 
% 
% ylabel('Change in Gravitational Anomaly')
% ylim([-20 20])
% xlabel('Years')
% 
% xticks(T)
% xticklabels({'2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'})
% xtickangle(45);
% %set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% title('Annual Mean of Gravitational Anomaly (2002 - 2017)','Interpreter', 'none', ...
%        'FontSize',16, 'FontWeight','bold');
% legend('Annual Mean','linear fit')
% grid on

% fig02 = figure('units','normalized','outerposition',[0 0 1 1]);
% plot(T,K1,'linewidth',2,'color','red')
% hold on
% plot(T,K2,'linewidth',2,'color','blue')
% hold on
% grid on;
% 
% for i = 1:length(V)
% text(T(i),K1(i),num2str(   K1(i)),'VerticalAlignment','bottom');
% text(T(i),K2(i),num2str(   K2(i)),'VerticalAlignment','bottom');
% end 
% 
% ylabel('Change in Gravitational Anomaly')
% ylim([-20 20])
% xlabel('Years')
% 
% xticks(T)
% xticklabels({'2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'})
% xtickangle(45);
% %set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% title('Annual Mean of Gravitational Anomaly (2002 - 2017) of Uttarakhand','Interpreter', 'none', ...
%        'FontSize',16, 'FontWeight','bold');
% legend('List Mean','Matrix Mean')
% grid on

fig03 = figure('units','normalized','outerposition',[0 0 1 1]);
plot(T,K1,'linewidth',2,'color','red','Marker','x')
hold on
plot(T,H1,'linewidth',2,'color',[0 0.4 0.8])
hold on
plot(T,U1,'linewidth',2,'color',[0 0.7 0.2])
hold on
grid on;

for i = 1:length(V)
text(T(i),K1(i),num2str(   K1(i)),'VerticalAlignment','bottom');
text(T(i),H1(i),num2str(   H1(i)),'VerticalAlignment','bottom');
text(T(i),U1(i),num2str(   U1(i)),'VerticalAlignment','bottom');

end 

ylabel('Change in Gravitational Anomaly')
ylim([-60 25])
xlabel('Years')

xticks(T)
xticklabels({'2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'})
xtickangle(45);
%set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
title('Annual List Mean of Gravitational Anomaly (2002 - 2017) of JK, HP & UK','Interpreter', 'none', ...
       'FontSize',16, 'FontWeight','bold');
legend('Jammu & Kashmir','Himachal Pradesh','Uttarakhand')
grid on

fig04 = figure('units','normalized','outerposition',[0 0 1 1]);
plot(T,K2,'linewidth',2,'color','red')
hold on
plot(T,H2,'linewidth',2,'color',[0 0.4 0.8])
hold on
plot(T,U2,'linewidth',2,'color',[0 0.7 0.2])
hold on
grid on;

for i = 1:length(V)
text(T(i),K2(i),num2str(   K2(i)),'VerticalAlignment','bottom');
text(T(i),H2(i),num2str(   H2(i)),'VerticalAlignment','bottom');
text(T(i),U2(i),num2str(   U2(i)),'VerticalAlignment','bottom');

end 

ylabel('Change in Gravitational Anomaly')
ylim([-60 25])
xlabel('Years')

xticks(T)
xticklabels({'2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'})
xtickangle(45);
%set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
title('Annual Matrix Mean of Gravitational Anomaly (2002 - 2017) of JK, HP & UK','Interpreter', 'none', ...
       'FontSize',16, 'FontWeight','bold');
legend('Jammu & Kashmir','Himachal Pradesh','Uttarakhand')
grid on



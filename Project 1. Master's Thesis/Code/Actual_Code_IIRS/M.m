% A= [1 2 8;3 7 0;1 2 2];
% B = [1 2 8;3 7 0;1 2 2];
% disp(A);
% disp(B);
% I = mean(A,B);

f1 = [NaN 1 1 -4;1 1 1 1;1 1 1 1;1 1 1 1];
f2 = [NaN 1 1 16;1 1 1 1;1 1 1 1;1 1 1 NaN];

Fout = (f1+f2)/2;

Mi={f1,f2};
meanMatrix2=cat(3,Mi{:}); %Buiding a 3D Data Array
Fout2 = f1;
Fout2(:,:) = 0;

Fout2 = nanmean(meanMatrix2,3);



% A=[1,NaN,3;2,3,4;3,4,5]; 
% B=[2,3,4;3,4,5;4,NaN,6]; 
% C=[3,4,5;4,5,6;5,6,7];
% D=[1 NaN 8;3 7 0;1 NaN 2]; 
% disp('------------------------------------');
% out = (A+B+C+D)/4;
% %disp(meanMatrix);
% 
% disp('------------------------------------');
% Mi={A,B,C,D};
% meanMatrix2=cat(3,Mi{:});
% out1 = mean(meanMatrix2,3); 
% disp(out);
% disp('------------------------------------');
% 
% Mi={A,B,C,D};
% % meanMatrix3=cat(3,Mi{:});
% % meanMatrix3 = meanMatrix3(~isnan(meanMatrix3)); 
% out2 = A;
% out2(:,:) = 0;
% %out1 = nanmean(Mi{:},3);
% out2 = nanmean(meanMatrix2,3);
% disp(out2);
% %O1 = meanMatrix3(~isnan(meanMatrix3));
% 
% 
% % n1 = nanmean(A);
% % n2 = mean(A,'omitnan');
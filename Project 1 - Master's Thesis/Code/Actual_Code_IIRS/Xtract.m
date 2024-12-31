function [X,X1,X2,Amin,Amax] = Xtract(filename)

[GAdata, REFMAT, BBOX] = geotiffread(filename);

[M,N] = size(GAdata);

delta_x = (BBOX(2,1) - BBOX(1,1))/N;

delta_y = (BBOX(2,2) - BBOX(1,2))/M;

longi = BBOX(1,1):delta_x:BBOX(2,1);

lat = BBOX(1,2):delta_y:BBOX(2,2);

% placing coords in center of pixel:

longi = longi(1:end-1) + delta_x/2;

lat = lat(1:end-1) + delta_y/2;

 

latitude = zeros(M,N);

longitude = zeros(M,N);

for i=1:length(longi)

    latitude(:,i) = fliplr(lat);

end

 

for i=1:length(lat)

    for j=1:length(longi)

        longitude(i,j) = longi(j);

    end

end

%Amin = min(min(GAdata));

Amin2 = unique(nonzeros(GAdata)); %does sorting and remove duplicates
A2min = Amin2(2);
%disp(A2min);
Amax = max(max(GAdata));
%disp(Amax);
% % ---- Himalaya Coordinates ----%
% latMin  =  min(min(latitude));
% latMax  =  max(max(latitude));
% longMin =  min(min(longitude));
% longMax =  max(max(longitude));
% % -------------------------------

X = GAdata;
X1 = latitude;
X2 = longitude;

index = find(X < A2min);% NaN values screened out
X(index) =  NaN; %Main Problem
% X1(index) = 0;
% X2(index) = 0;

X=double(X);

Amin = min(min(X));
end
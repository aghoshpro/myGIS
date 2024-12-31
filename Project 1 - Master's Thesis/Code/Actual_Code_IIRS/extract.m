function [A, latitude,longitude] = extract(filename)

[A, REFMAT, BBOX] = geotiffread(filename);

[M,N] = size(A);

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

end
function [meanSigmaScreened, meanSigma532_BTScreened, meanSigma532_BPScreened, meanSigma532_DPScreened, alts, numSamplesScreened] = Screen(filename,latMin,latMax,longMin,longMax)

% Read in the altitude array.
metadata = hdfread(filename, '/metadata', 'Fields', 'Lidar_Data_Altitudes', 'FirstRecord',1 ,'NumRecords',1);
alt = metadata{1};

%---- Altitude < 5 Km ----%

alt_new = find(alt<5.0);
alts = alt(alt_new(1):399,1:1);

numberAlts = length(alts);

% since hdf is zero based, this extracts the latitude  at the midpoint of
% the 5 km profile
product_name = 'Latitude';
[info, lat] = readHDF(filename,product_name,[0 1],[-9 1]);

product_name = 'Longitude';
[info, long] = readHDF(filename,product_name,[0 1],[-9 1]);
 
% Determine the indices of the profiles within the latitude range.
latlongRangeWanted = lat > latMin & lat < latMax & long > longMin & long < longMax;
firstProfile = find(latlongRangeWanted,1,'first');
lastProfile = find(latlongRangeWanted,1,'last');

numberProfiles = lastProfile - firstProfile + 1;

% Now read in everything else. The readHDF function reads in the arrays
% from the index of the first profile in the latitude range. One is
% subtracted because hdf is zero based and MATLAB is not.

product_name = 'Extinction_Coefficient_532';
[info, sigma532] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);

product_name = 'Extinction_Coefficient_Uncertainty_532';
[info, sigma532_uncer] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);

%PARTICULATE_DEPOLARIZATION_RATIO_PROFILE_532nm
%-------------------------------------------------------------------------------------------------------
product_name = 'Particulate_Depolarization_Ratio_Profile_532';
[info, sigma532_DP] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);

product_name = 'Particulate_Depolarization_Ratio_Uncertainty_532';
[info, sigma532_DP_uncer] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);


%TOTAL BACKSCATTER COEFFICIENT 532nm
%-------------------------------------------------------------------------------------------------------
product_name = 'Total_Backscatter_Coefficient_532';
[info, sigma532_BT] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);

product_name = 'Total_Backscatter_Coefficient_Uncertainty_532';
[info, sigma532_BT_uncer] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);


%PARPENDICULAR BACKSCATTER COEFFICIENT 532nm
%-------------------------------------------------------------------------------------------------------
product_name = 'Perpendicular_Backscatter_Coefficient_532';
[info, sigma532_BP] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);

product_name = 'Perpendicular_Backscatter_Coefficient_Uncertainty_532';
[info, sigma532_BP_uncer] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1],[numberProfiles -9]);


% The size of the these arrays will be 2 x numberAlts x numberProfiles.
product_name = 'Extinction_QC_Flag_532';
[info, extQC] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1 0],[numberProfiles -9 -9]); 

product_name = 'CAD_Score';
[info, CAD] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1 0],[numberProfiles -9 -9]);     

product_name = 'Atmospheric_Volume_Description';
[info, AVD] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1 0],[numberProfiles -9 -9]);

product_name = 'Aerosol_Layer_Fraction';
[info, ALF] = readHDF(filename,product_name,[firstProfile-1 alt_new(1)-1 ],[numberProfiles -9]);


% I'm going to transpose these arrays so they will have size that will be
% similar to the following three, numberAlts x numberProfiles.
sigma532 = sigma532';
sigma532_uncer = sigma532_uncer';

sigma532_BT = sigma532_BT';
sigma532_BT_uncer = sigma532_BT_uncer';

sigma532_BP = sigma532_BP';
sigma532_BP_uncer = sigma532_BP_uncer';
 

sigma532_DP = sigma532_DP';
sigma532_DP_uncer = sigma532_DP_uncer';

% ------------------- Decide what data to screen out -------------------- %
% ----------------------------------------------------------------------- %

% To indicate which data to screen out, I prefer to use a logical array
% that is the same size as the data I am screening (in this case, the size
% of sigma). I will keep elements that are 'true' in the average and
% I discard elements that are 'false'. Let's call this array useSamples.
useSamples532 = true(numberAlts,numberProfiles);

useSamples532_T = true(numberAlts,numberProfiles);

useSamples532_P = true(numberAlts,numberProfiles);

useSamples532_DP = true(numberAlts,numberProfiles);

% -- Screen out fill values -- %
useSamples532(sigma532 == -9999) = false;

useSamples532_T(sigma532_BT == -9999) = false;

useSamples532_P(sigma532_BP == -9999) = false;

useSamples532_DP(sigma532_DP == 9999) = false;


% -- Screen out all features that are not aerosols -- %
% The AVD array is very similar to the feature classification flags array
% since it contains feature type and subtype information. The following
% function extracts this information from the AVD. 
[ftype, subtype] = get_feature_type_and_subtype(AVD);

% Now, AVD has size 2 x numberAlts x numberProfiles while sigma has size
% numberAlts x numberProfiles. This is because sigma is reported at 60 m
% vertical resolution and in the lower troposphere CALIPSO resolution is
% reported at 30 m. So, 2 elements are required to describe the features
% within a 60 m sigma sample. See the Atmospheric Volume Description entry
% in the CALIPSO Data Qualtity Summaries for more information...

% We will check both 30 m altitude bins for every 60 m sigma profile and
% will use the sample if either 30 m bin contains an aerosol. For aerosols,
% feature type = 3.
isAerosol = squeeze(ftype(1,:,:) == 3 | ftype(2,:,:) == 3);
useSamples532(~isAerosol) = false;

isAerosol = squeeze(ftype(1,:,:) == 3 | ftype(2,:,:) == 3);
useSamples532_T(~isAerosol) = false;

isAerosol = squeeze(ftype(1,:,:) == 3 | ftype(2,:,:) == 3);
useSamples532_P(~isAerosol) = false;

isAerosol = squeeze(ftype(1,:,:) == 3 | ftype(2,:,:) == 3);
useSamples532_DP(~isAerosol) = false;

% -- Screen by CAD Score -- %

% For this example, we will screen out aerosol layers whose CAD score is
% greater than -20. For a conservative approach, we will screen out the
% entire 60 m sigma bin if either 30 m element in that bin has CAD > -20.
% Furthermore, since cloud CAD scores are also reported in the profile
% product CAD score arrays, we will first make all cloud scores equal to
% fill values so we don't screen out cases where a 30 m cloud and a 30 m
% aerosol layer (with CAD < -20) exist in the same 60 m element.
CAD_fill = -127;
CAD(CAD > 0) = CAD_fill;
goodCAD = squeeze( (CAD(1,:,:) < -20 | CAD(1,:,:) == CAD_fill) &...
                   (CAD(2,:,:) < -20 | CAD(2,:,:) == CAD_fill) );
useSamples532(~goodCAD) = false;

CAD_fill = -127;
CAD(CAD > 0) = CAD_fill;
goodCAD = squeeze( (CAD(1,:,:) < -20 | CAD(1,:,:) == CAD_fill) &...
                   (CAD(2,:,:) < -20 | CAD(2,:,:) == CAD_fill) );
useSamples532_T(~goodCAD) = false;

CAD_fill = -127;
CAD(CAD > 0) = CAD_fill;
goodCAD = squeeze( (CAD(1,:,:) < -20 | CAD(1,:,:) == CAD_fill) &...
                   (CAD(2,:,:) < -20 | CAD(2,:,:) == CAD_fill) );
useSamples532_P(~goodCAD) = false;

CAD_fill = -127;
CAD(CAD > 0) = CAD_fill;
goodCAD = squeeze( (CAD(1,:,:) < -20 | CAD(1,:,:) == CAD_fill) &...
                   (CAD(2,:,:) < -20 | CAD(2,:,:) == CAD_fill) );
useSamples532_DP(~goodCAD) = false;

% -- Screen by extinction QC flags -- %
% The CALIPSO extinction QC flags summarize the initial and final state of
% the extinction retrieval. During the iterative process to find a solution
% the lidar ratio may be adjusted. Often, we have most confidence in 
% extinction solutions when the lidar ratio is unchanged during the 
% retrieval (extinction QC = 0) or if the retrieval is constrainted
% (extinction QC = 1). See the final lidar ratio and extinction QC entries
% in the CALIPSO Layer Products Data Quality Summaries for more details.

% The extinction QC flags reported are reported from both clouds and
% aerosols in the array. Because the extinction is retrieved from both 30 m
% bins in the 60 m bin, regardless of feature type, we will check the
% extinction QC flags for all features (including clouds in the array). If
% either 30 m element is not 0 or 1, we will throw out the whole 60 m bin.

extQCfill = 32768;
extQC(ftype ~= 3) = extQCfill;
goodExtQC = squeeze(...
    (extQC(1,:,:) == 0 | extQC(1,:,:) == 1 | extQC(1,:,:) == extQCfill) & ...
    (extQC(2,:,:) == 0 | extQC(2,:,:) == 1 | extQC(2,:,:) == extQCfill)); 
useSamples532(~goodExtQC) = false;
%--------------------------------------------------------------------------------
extQCfill = 32768;
extQC(ftype ~= 3) = extQCfill;
goodExtQC = squeeze(...
    (extQC(1,:,:) == 0 | extQC(1,:,:) == 1 | extQC(1,:,:) == extQCfill) & ...
    (extQC(2,:,:) == 0 | extQC(2,:,:) == 1 | extQC(2,:,:) == extQCfill)); 

useSamples532_T(~goodExtQC) = false;
%--------------------------------------------------------------------------------
extQCfill = 32768;
extQC(ftype ~= 3) = extQCfill;
goodExtQC = squeeze(...
    (extQC(1,:,:) == 0 | extQC(1,:,:) == 1 | extQC(1,:,:) == extQCfill) & ...
    (extQC(2,:,:) == 0 | extQC(2,:,:) == 1 | extQC(2,:,:) == extQCfill)); 

useSamples532_P(~goodExtQC) = false;
%-------------------------------------------------------------------------------------------------------
extQCfill = 32768;
extQC(ftype ~= 3) = extQCfill;
goodExtQC = squeeze(...
    (extQC(1,:,:) == 0 | extQC(1,:,:) == 1 | extQC(1,:,:) == extQCfill) & ...
    (extQC(2,:,:) == 0 | extQC(2,:,:) == 1 | extQC(2,:,:) == extQCfill)); 

useSamples532_DP(~goodExtQC) = false;


% -- Screen by extinction uncertainty -- %
% CALIPSO extinction uncertainty is retrieved in an iterative process that
% sometimes does not converge to a solution. When the retrieved extinction
% begins to grow without bound, the extinction uncertainty is assigned a
% value of 99.99 to indicate the solution has "blown up". The extinction
% values should not be trusted when the extinction uncertainty is 99.99.
useSamples532(sigma532_uncer > 99.9) = false;
useSamples532_T(sigma532_BT_uncer > 99.9) = false;
useSamples532_P(sigma532_BP_uncer > 99.9) = false;
useSamples532_DP(sigma532_DP_uncer > 99.9) = false;

%--- Screened By ALF Score ---%
useSamples532(ALF < 0 | ALF > 15) = false;
useSamples532_T(ALF < 0 | ALF > 15) = false;
useSamples532_P(ALF < 0 | ALF > 15) = false;
useSamples532_DP(ALF < 0 | ALF > 15) = false;

meanSigmaScreened = zeros(numberAlts,1);
%meanSigmaScreened_uncer = zeros(numberAlts,1);
numSamplesScreened = zeros(numberAlts,1);

for k = 1:numberAlts
        %t = sigma532(k,:) ~= -9999;
        meanSigmaScreened(k) = mean(sigma532(k,useSamples532(k,:)));
    
    % Calculate the uncertainty by propogating the extinction uncertainty,
    % i.e., the square of the uncertainty is the sum of the squares of the
    % errors divided by the number of samples...
    numSamplesScreened(k) = sum(useSamples532(k,:));
%     if numSamplesScreened(k) > 0
%         meanSigmaScreened_uncer(k) = sqrt(sum(sigma532_uncer(k,useSamples532(k,:)).^2)./numSamplesScreened(k));
%     end
    
end

%Total_Backscatter_Coefficient_532
%-------------------------------------------------------------------------------------------------------
meanSigma532_BTScreened = zeros(numberAlts,1);
% meanSigma532_BTScreened_uncer = zeros(numberAlts,1);
numSamples532_BTScreened = zeros(numberAlts,1);

for k = 1:numberAlts
    
    %t = sigma532_BT(k,:) ~= -9999;
    meanSigma532_BTScreened(k) = mean(sigma532_BT(k,useSamples532_T(k,:)));
    
        numSamples532_BTScreened(k) = sum(useSamples532_T(k,:));
%     if numSamples532_BTScreened(k) > 0
%         meanSigma532_BTScreened_uncer(k) = sqrt(sum(sigma532_BT_uncer(k,useSamples532_T(k,:)).^2)./numSamples532_BTScreened(k));
%     end
    
end

%Perpendicular_Backscatter_Coefficient_532
%-------------------------------------------------------------------------------------------------------
meanSigma532_BPScreened = zeros(numberAlts,1);
% meanSigma532_BPScreened_uncer = zeros(numberAlts,1);
numSamples532_BPScreened = zeros(numberAlts,1);

for k = 1:numberAlts
    
%     t = sigma532_BP(k,:) ~= -9999;
    meanSigma532_BPScreened(k) = mean(sigma532_BP(k,useSamples532_P(k,:)));
    
    numSamples532_BPScreened(k) = sum(useSamples532_P(k,:));
%     if numSamples532_BPScreened(k) > 0
%         meanSigma532_BPScreened_uncer(k) = sqrt(sum(sigma532_BP_uncer(k,useSamples532_P(k,:)).^2)./numSamples532_BPScreened(k));
%     end
    
end


%Particulate_Depolarization_Ratio_Profile_532
%-------------------------------------------------------------------------------------------------------
meanSigma532_DPScreened = zeros(numberAlts,1);
%meanSigma532_DPScreened_uncer = zeros(numberAlts,1);
numSamples532_DPScreened = zeros(numberAlts,1);

for k = 1:numberAlts
    
    %t = sigma532_DP(k,:) ~= -9999;
    meanSigma532_DPScreened(k) = mean(sigma532_DP(k,useSamples532_DP(k,:)));
    
    numSamples532_DPScreened(k) = sum(useSamples532_DP(k,:));
%     if numSamples532_DPScreened(k) > 0
%         meanSigma532_DPScreened_uncer(k) = sqrt(sum(sigma532_DP_uncer(k,useSamples532_DP(k,:)).^2)./numSamples532_DPScreened(k));
%     end
    
end




end
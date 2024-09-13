function [ftype, subtype] = get_feature_type_and_subtype(FCF)
% This function accepts an array of feature classification flags (FCF) and
% returns arrays feature type, and feature subtype. Feature and subtype are
% defined in Table 44 of the CALIPSO Data Products Catalog (Version 3.2).
% Note that the definition of feature subtype depends on the feature type!
% INPUTS
%   FCF, an array of CALIPSO feature classifiction flags. 
%       Type: uint16
% OUTPUTS 
%   ftype, an array the same size as FCF containing the feature type. 
%       Type: uint16
%   subtype, an array the same size as FCF containing the feature subtype.
%       Type: uint16
% Modified from M. Vaughn's "extract5kmAerosolLayerDescriptors.m" code by 
% J. Tackett September 23, 2010. jason.l.tackett@nasa.gov

% ---------- Get feature type --------- %
% These are the values returned and their definitions.
%   0 = invalid (bad or missing data)
%   1 = "clear air"
%   2 = cloud
%   3 = aerosol
%   4 = stratospheric feature; polar stratospheric cloud (PSC) or stratospheric aerosol
%   5 = surface
%   6 = subsurface
%   7 = no signal (totally attenuated)
    ftype = bitand(FCF, 7);

% -------- Get feature subtype -------- % 
% NOTE: the definition of feature subtype will depend on the feature type!
% See the feature classification flags definition table in the CALIPSO Data
% Products Catalog for more details.

% -- Subtype definitions for AEROSOLS
%   0 = not determined
%   1 = clean marine
%   2 = dust
%   3 = polluted continental
%   4 = clean continental
%   5 = polluted dust
%   6 = smoke
%   7 = other

% -- Subtype definitions for CLOUDS
%   0 = low overcast, transparent
%   1 = low overcast, opaque
%   2 = transition stratocumulus
%   3 = low, broken cumulus
%   4 = altocumulus (transparent)
%   5 = altostratus (opaque)
%   6 = cirrus (transparent)
%   7 = deep convective (opaque)
    typeBits       = bitshift(FCF, -9);
    subtype = bitand(typeBits, 7);

end



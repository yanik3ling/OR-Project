function out = dicom_set_imfinfo_values(in, file)
%DICOM_SET_IMFINFO_VALUES  Get IMFINFO-specific values from DICOM data.

%   Copyright 1993-2015 The MathWorks, Inc.

out = in;
  
% Fill other IMFINFO-specific values

if (isfield(in, 'Columns'))
    out.Width = in.Columns;
end

if (isfield(in, 'Rows'))
    out.Height = in.Rows;
end

if (isfield(in, 'BitsStored'))
    out.BitDepth = in.BitsStored;
end

if (isfield(in, 'PhotometricInterpretation'))
    
    % See PS 3.3-1999 Sec. C.7.6.3.1.2.

    switch (in.PhotometricInterpretation)
    case {'MONOCHROME1', 'MONOCHROME2'}
        out.ColorType = 'grayscale';
        
    case {'PALETTE COLOR'}
        out.ColorType = 'indexed';
        
    case {'RGB', 'HSV', 'ARGB', 'CMYK', 'YBR_FULL', 'YBR_FULL_422', ...
          'YBR_PARTIAL_422'}
        out.ColorType = 'truecolor';
        
    end
    
end

if (isfield(in, 'RecognitionCode'))
    
    % This retired code (0008,0010) should only be present in ACR-NEMA.
    
    out.Format = 'ACR/NEMA';
    out.FormatVersion = in.RecognitionCode;
    
end

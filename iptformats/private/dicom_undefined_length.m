function value = dicom_undefined_length
%DICOM_UNDEFINED_LENGTH   Return the UINT32 value 0xFFFFFFFF.
%
%   VALUE = DICOM_UNDEFINED_LENGTH() returns the constant value
%   given by the command uint32(inf).  In DICOM, this value
%   represents an undefined length.
%
%   This function exists to prevent integer overflow warnings.

%   Copyright 1993-2005 The MathWorks, Inc.

value = uint32(4294967295);   % 4294967295 == 0xFFFFFFFF == uint32(inf)

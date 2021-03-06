function uid = dicomuid
%DICOMUID   Generate DICOM Unique Identifier.
%   UID = DICOMUID creates a string, UID, containing a new DICOM unique
%   identifier.
%
%   Multiple calls to DICOMUID will produce globally unique values.  Two
%   calls to DICOMUID will always return different values.
%
%   See also DICOMWRITE, DICOMINFO.

%   Copyright 1993-2005 The MathWorks, Inc.
%   

uid = dicom_generate_uid('instance');

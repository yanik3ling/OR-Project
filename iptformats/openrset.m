function openrset(filename)
%OPENRSET   Open R-Set file.
%   OPENRSET(FILENAME) opens the reduced resolution dataset (R-Set)
%   specified by FILENAME for viewing.
%
%   See also IMTOOL, RSETWRITE.

%   Copyright 2009 The MathWorks, Inc.
    
    if isrset(filename)
        imtool(filename)
    else
          error(message('images:openrset:invalidRSet', filename));
    end

    

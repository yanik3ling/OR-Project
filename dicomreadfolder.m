function [ X ] = dicomreadfolder( folder )
%UNTITLED Read a folder containing a dicom image series
%   Detailed explanation goes here
dicomlist = dir(fullfile(folder,'*.dcm'));
info=dicominfo(fullfile(folder, dicomlist(1).name));
X=zeros(info.Height, info.Width);
n=numel(dicomlist);
X(:,:,n)=X(:,:,1);
for i = 1 : n
    X(:,:,n-i+1) = dicomread(fullfile(folder,dicomlist(i).name));  
end

end


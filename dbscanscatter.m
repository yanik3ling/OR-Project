clf;
hold on;

% threshold for extracting pixels belonging to metal objects
% (i.e. electrodes, pacemaker, tooth fillings, etc.)
% Don't set this too low, dbscan runs in n^2
threshold=0.99;

X=dicomreadfolder('Dataset 1');

% Retrieve indices of voxels with a high intensity (>99% of dynamic range)
[I, J, K]=ind2sub(size(X), find(X > min(X(:))*(1-threshold) + max(X(:)*threshold )));

% matrix containing in each row the x-y-z coordinates of a high-intensity
% voxel
cloud=[I J K];

% dbscan clustering algorithm, returns a list of cluster indices
% corresponding to points in 'cloud'
% second parameter is the minimum distance for two voxels to be considered
% as part of one cluster. If set too low, clusters may be split. If set too
% high, two or more clusters may be merged.
% third parameter is the minimum number of voxels a cluster must have, else
% it is discarded (classified as noise, gets index -1)
[labs, labscore]=dbscan(cloud, 5, 6);

elecs=[];

for c = 1:max(labs) %c is the number of clusters found and also the index
    cluster=cloud(labs==c, :);
    meanc=mean(cluster);
    clusternorm=cluster-ones(size(cluster,1),1)*meanc;
    
    % mighty singlular value decomposition, S and V give eigenvectors of
    % the covariance matrix, aka Principal Component Analysis
    [U, S, V]=svd(clusternorm,0);
    
    if(norm(diag(S))<15) % classify as electrode
        color=[0 0.5 0];
        elecs=[elecs;meanc];
    else % classify as whatever
        color=[0.5 0 0];
    end
    
    % ---- plot stuff ------
    % plot the cluster, green if electrode, red otherwise
    scatter3(cluster(:,1), cluster(:,2), cluster(:,3), 20, color, '.')
    
    % plot the vectors of the PCA
    %     VS=V*S;
    %     for i = 1:3
    %         v=VS(:,i);
    %         plot3([meanc(1), meanc(1)+v(1)],[meanc(2), meanc(2)+v(2)],[meanc(3), meanc(3)+v(3)], 'k')
    %     end
end
save('electrodes.mat','elecs');
hold off;
axis equal %<-- must enter manually, does not work when done in a script
axis vis3d %<-- for some reason

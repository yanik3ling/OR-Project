clf;
hold off;

% ------ initialization -----------
eps=0.0001;
duration=240;
subdiv=3;
[s, F]=icosphere(subdiv);
n=size(s,1);
v=zeros(n,3);
force=zeros(size(s));
adj=false(n,n);
adj(F(:,1)+n*(F(:,2)-1))=true;
adj(F(:,1)+n*(F(:,3)-1))=true;
adj(F(:,2)+n*(F(:,1)-1))=true;
adj(F(:,2)+n*(F(:,3)-1))=true;
adj(F(:,3)+n*(F(:,1)-1))=true;
adj(F(:,3)+n*(F(:,2)-1))=true;
nbs=zeros(n,6);
for i = 1:n
    c=1;
    for j=1:n
        if(adj(i,j))
            nbs(i,c)=j;
            c=c+1;
        end
    end
end

% ----- edge (spring) properties ----
targetlength=0.02;
sconst=0.5;
compressionhardness=0.1;

% ----- node (joint) properties -----
stiffness=1;
airdampening=20;

% -------load and rescale electrodes ------
elecs=load('electrodes.mat');
elecs=elecs.elecs; %yay
emax=max(elecs(:));
emin=min(elecs(:));
elecs=(elecs-emin)/(emax-emin);
elecs=elecs*1.4-0.7;

% ------ electrodes properties --------
nelecs=size(elecs,1);
forcemulte=0.5;
radiusS=0.3;
radiusE=0.1;

% ------ simulation properties ------
stepsize=0.25;
iterations=round(duration/stepsize);
normnoise=0.01;

% vid = VideoWriter('newfile.avi');
% vid.FrameRate=round(1/stepsize);
% vid.Quality =90;
% open(vid);

for run=1:iterations
    radius=radiusS+(radiusE-radiusS)*run/iterations;
    % ---------- forces ----------
    for i=1:n
        force(i,:)=0;
        % spring force
        for nbI=1:6
            j=nbs(i,nbI);
            if(j~=0)
                delta=s(j,:)-s(i,:);
                ndelta=norm(delta);
                if ndelta>targetlength
                    df=(ndelta-targetlength)^2*sconst;
                else
                    df=(1-1/(max(ndelta,eps)/targetlength))*compressionhardness;
                end
                force(i,:)=force(i,:)+df*delta/max(ndelta,eps);
            end
        end
        % anti-gravitational force
        for j=1:nelecs
            delta=elecs(j,:)-s(i,:);
            if max(delta)<radius
                ndelta=norm(delta);
                if ndelta>radius
                    df=0;
                else
                    df=(1-1/(max(ndelta,eps)/radius))*forcemulte;
                end
                force(i,:)=force(i,:)+df*delta/max(ndelta,eps);
            end
        end
    end
    
    % ----------- dampening ----------
    for i=1:n
        vnorm=norm(v(i,:));
        df=-airdampening*vnorm^2;
        force(i,:)=force(i,:)+df*v(i,:)/max(vnorm,eps);
        v(i,:)= v(i,:)+force(i,:)*stepsize;
        
        vend=sqrt(norm(force(i,:))/airdampening);
        vnorm=norm(v(i,:));
        if vnorm>vend
            v(i,:)=vend*v(i,:)/vnorm;
        end
    end
    
    s=s+v*stepsize; %s=vt
    
    % ----------- plot ------------------
    %     hFig = figure(1);
    %     set(hFig, 'Position', [0,0 720,900])
    scatter3(elecs(:,1),elecs(:,2),elecs(:,3), radius*250, [0 0 0]);
    patch('Faces',F,'Vertices',s,...
        'VertexNormals',s,...
        'LineWidth',0.5,'FaceLighting','phong',...
        'BackFaceLighting','unlit',...
        'AmbientStrength',0.3,'DiffuseStrength',0.6,...
        'SpecularExponent',10,'SpecularStrength',0.9,...
        'FaceColor','flat','CData',s(:,3),...
        'Parent',gca,'Tag','Icosphere', ...
        'FaceAlpha',.7);
    axis equal;
    axis vis3d;
    view(360*run/iterations, 45);
    axis([-1 1 -1 1 -1 1]);
    %     frm=getframe;
    %     writeVideo(vid,frm);
    pause(0.0001);
end
% close(vid);
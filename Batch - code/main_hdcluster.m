%--------------------------------------------------------------------------
% This MATLAB file is for running and calling the HDCluster algorithm via
% hdcluster.p function. HDClsuter is a clustering algorithm that accepts 2D
% or 3D spatial data, and it returns points along with their cluster memberships.
% The noisy points get labeled as 0, signal points get unique IDs, where
% every point has a membership to one and only one cluster.
%
% The input to this function is the data as a first argument, and the 
% merging threshold distance mTh as a second argument. The other arguments
% are optional. 
% The first output is the retrieved cluster centers, the second argument is
% the label or clusterIDs that are given to every point according to its 
% membership to a cluster 
%
% Created by: Ismail M. Khater; 
% (email: ikhater@birzeit.edu; ismail.khater@gmail.com)
%
% This code is for the submitted paper: 
% "HDCluster: High-Degree Graph-Based Clustering Algorithm and its 
% Application to Single Molecule Localization Microscopy"
%
%==========================================================================
% NOTE: hdclsuter.p function runs only in MATLAB R2022a and later.
%==========================================================================
%
%% % Load data set
dataPath= ['./Data/'];
dataName = 'D31'; % http://cs.joensuu.fi/sipu/datasets/ 
path = [dataPath, dataName, '.txt'];
DF = importdata(path);
labels = DF(:,end); % classes
DF1 = DF(:,1:2); % data
 
% show the raw data 
figure('color', [1 1 1 1]);
scatter(DF1(:,1),DF1(:,2),6,labels, 'filled');
colormap(jet);
xlabel('X'); ylabel('Y'); axis equal;
title({['Ground truth data'],...
    ['Dataset "',dataName,'". Number of clusters = ',num2str(max(labels))]});
%% ---------------------------------------
% Run hdcluster on sample data without the densoing option
%
% Call HDClsuter: run only in MATLAB R2022a and later.
mTh =1;% 1.5; % HDClsuter param

[mDat, clustIDs] = hdcluster(DF1, mTh); % mDat is the cluster centers

figure('color', [1 1 1 1]);
if size(DF1,2)==2 % for 2D data
    scatter(DF1(:,1),DF1(:,2),6,clustIDs, 'filled');
%     hold on
%     scatter(mDat(:,1),mDat(:,2),50, 'r', 'filled', 'MarkerFaceColor',[0 0 0]);
    xlabel('X'); ylabel('Y')
else  % for 3D data
    scatter3(DF1(:,1),DF1(:,2),DF1(:,3),6,clustIDs, 'filled');
%     hold on
%     scatter3(mDat(:,1),mDat(:,2),mDat(:,3),50, 'r', 'MarkerFaceColor',[0 0 0]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
end
colormap(jet);
title({['Method: HDCluster. Merging thresh. = ',num2str(mTh)],...
    ['Dataset "',dataName,'". Number of clusters = ',num2str(max(clustIDs))]});
axis equal;





%% Run hdclsuter with default densoing
isNoise = 1; % isNoise = 1 to enable the densoing option
mTh = 400;%3.7;%1.5; % HDClsuter param
[mDat, clustIDs] = hdcluster(DF1, mTh, isNoise); % mDat is the cluster centers

figure('color', [1 1 1 1]);
if size(DF1,2)==2 % for 2D data
    scatter(DF1(:,1),DF1(:,2),6,clustIDs, 'filled');
%     hold on
%     scatter(mDat(:,1),mDat(:,2),50, 'r', 'filled', 'MarkerFaceColor',[0 0 0]);
    xlabel('X'); ylabel('Y')
else  % for 3D data
    scatter3(DF1(:,1),DF1(:,2),DF1(:,3),6,clustIDs, 'filled');
%     hold on
%     scatter3(mDat(:,1),mDat(:,2),mDat(:,3),50, 'r', 'MarkerFaceColor',[0 0 0]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
end
colormap(jet);
title({['Method: HDCluster. Merging thresh. = ',num2str(mTh)],...
    ['Dataset "',dataName,'". Number of clusters = ',num2str(max(clustIDs))]});
axis equal;





%% Run hdclsuter with densoing option and set the densoing parameter beta
mTh = 0.7; % HDClsuter param
isNoise = 1; % isNoise = 1 to enable the densoing option
beta = 1.4; % set the denoisalphaing parameter
[mDat, clustIDs] = hdcluster(DF1, mTh, isNoise, beta); % mDat is the cluster centers

figure('color', [1 1 1 1]);
if size(DF1,2)==2 % for 2D data
    scatter(DF1(:,1),DF1(:,2),6,clustIDs, 'filled');
%     hold on
%     scatter(mDat(:,1),mDat(:,2),50, 'r', 'filled', 'MarkerFaceColor',[0 0 0]);
    xlabel('X'); ylabel('Y')
else  % for 3D data
    scatter3(DF1(:,1),DF1(:,2),DF1(:,3),6,clustIDs, 'filled');
%     hold on
%     scatter3(mDat(:,1),mDat(:,2),mDat(:,3),50, 'r', 'MarkerFaceColor',[0 0 0]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
end
colormap(jet);
title({['Method: HDCluster. Merging thresh. = ',num2str(mTh)],...
    ['Dataset "',dataName,'". Number of clusters = ',num2str(max(clustIDs))]});
axis equal;




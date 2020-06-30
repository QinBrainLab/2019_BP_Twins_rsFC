% hao adapted for his poject on September 12, 2017 from Qin
% ======================================================================== %
clear
%restoredefaultpath

%% Set up configure
% Set up
roi_form   = 'nii';
roinum     = 'yes'; % 'yes' or 'no'
radius     = 4;
spm_dir    = '/Users/xujiahua/Documents/MATLAB/spm12';
script_dir = '/Users/xujiahua/Documents/Code/roi_analysis';

% This is the folder which you will save defined ROIs
roi_folder = '/Users/xujiahua/Documents/ROI_0518';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'LBLA-IFG';
myroi{1}.coords  = [-32,38,8];
myroi{1}.radius  = radius;

myroi{2}.name    = 'LBLA-FML';
myroi{2}.coords  = [-22,28,28];
myroi{2}.radius  = radius;



myroi{3}.name    = 'LBLA-FML2';
myroi{3}.coords  = [-24,28,28];
myroi{3}.radius  = radius;

myroi{4}.name    = 'LAMY-FML3';
myroi{4}.coords  = [-24,28,32];
myroi{4}.radius  = radius;

myroi{5}.name    = 'LAMY-FML4';
myroi{5}.coords  = [-20,28,30];
myroi{5}.radius  = radius;




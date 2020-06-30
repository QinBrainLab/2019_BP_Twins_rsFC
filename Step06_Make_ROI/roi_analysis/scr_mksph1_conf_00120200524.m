% hao adapted for his poject on September 12, 2017 from Qin
% ======================================================================== %
clear
%restoredefaultpath

%% Set up configure
% Set up
roi_form   = 'nii';
roinum     = 'yes'; % 'yes' or 'no'
radius     = 2;
spm_dir    = '/Users/xujiahua/Documents/MATLAB/spm12';
script_dir = '/Users/xujiahua/Documents/Code/roi_analysis';

% This is the folder which you will save defined ROIs
roi_folder = '/Users/xujiahua/Documents/ROI_0524';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'LAMY-Occipital_Mid_R';
myroi{1}.coords  = [38,-74,6];
myroi{1}.radius  = radius;



% hao adapted for his poject on September 12, 2017 from Qin
% ======================================================================== %
clear
%restoredefaultpath

%% Set up configure
% Set up
roi_form   = 'nii';
roinum     = 'yes'; % 'yes' or 'no'
radius     = 8;
spm_dir    = '/Users/xujiahua/Documents/MATLAB/spm12';
script_dir = '/Users/xujiahua/Documents/Code/roi_analysis';

% This is the folder which you will save defined ROIs
roi_folder = '/Users/xujiahua/Documents/ROI_filtered_24head_1csf_1wm';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'CONN-LAMY';
myroi{1}.coords  = [-34,38,8];
myroi{1}.radius  = radius;

myroi{2}.name    = 'CONN-LAMY';
myroi{2}.coords  = [12,-16,34];
myroi{2}.radius  = radius;



myroi{3}.name    = 'CONN-LAMY';
myroi{3}.coords  = [22,18,34];
myroi{3}.radius  = radius;

myroi{4}.name    = 'CONN-LAMY';
myroi{4}.coords  = [62,-14,-16];
myroi{4}.radius  = radius;




myroi{5}.name    = 'CONN-LAMY';
myroi{5}.coords  = [14,-14,34];
myroi{5}.radius  = radius;



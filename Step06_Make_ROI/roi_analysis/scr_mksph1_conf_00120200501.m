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
roi_folder = '/Users/xujiahua/Documents/ROI_small_radius';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'Arrange_confile_filtered_24head_1csf_1wm-LAMY-IFG';
myroi{1}.coords  = [-34,38,8];
myroi{1}.radius  = radius;

myroi{2}.name    = 'Arrange_confile_filtered_24head_1csf_1wm-LAMY-RACC';
myroi{2}.coords  = [12,-16,34];
myroi{2}.radius  = radius;



myroi{3}.name    = 'conn_Filtered_eigen1(CONN)-RAMY-Frontal_Mid';
myroi{3}.coords  = [-40,36,36];
myroi{3}.radius  = radius;

myroi{4}.name    = 'Filtered_subregions(CONN)-RBLA-Frontal_Mid';
myroi{4}.coords  = [-34,50,20];
myroi{4}.radius  = radius;

myroi{5}.name    = 'Filtered_subregions(CONN)-RBLA-Frontal_Inf';
myroi{5}.coords  = [-36,30,4];
myroi{5}.radius  = radius;






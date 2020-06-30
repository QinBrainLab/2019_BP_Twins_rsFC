% hao adapted for his poject on September 12, 2017 from Qin
% ======================================================================== %
clear
%restoredefaultpath

%% Set up configure
% Set up
roi_form   = 'nii';
roinum     = 'yes'; % 'yes' or 'no'
radius     =4;
spm_dir    = '/Users/xujiahua/Documents/MATLAB/spm12';
script_dir = '/Users/xujiahua/Documents/Code/roi_analysis';

% This is the folder which you will save defined ROIs
roi_folder = '/Users/xujiahua/Documents/ROI_subregion_2';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'CONN-LAMY';
myroi{1}.coords  = [-26,30,18];
myroi{1}.radius  = radius;

myroi{2}.name    = 'CONN-LAMY';
myroi{2}.coords  = [34,32,0];
myroi{2}.radius  = radius;



myroi{3}.name    = 'CONN-LAMY';
myroi{3}.coords  = [16,30,20];
myroi{3}.radius  = radius;

myroi{4}.name    = 'CONN-LAMY';
myroi{4}.coords  = [34,34,0];
myroi{4}.radius  = radius;




myroi{5}.name    = 'CONN-LAMY';
myroi{5}.coords  = [-22,-14,52];
myroi{5}.radius  = radius;

myroi{6}.name    = 'CONN-LAMY';
myroi{6}.coords  = [-26,30,16];
myroi{6}.radius  = radius;

myroi{7}.name    = 'CONN-RAMY';
myroi{7}.coords  = [-40,34,36];
myroi{7}.radius  = radius;



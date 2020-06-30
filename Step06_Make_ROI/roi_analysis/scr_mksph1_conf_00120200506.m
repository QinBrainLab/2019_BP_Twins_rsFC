% hao adapted for his poject on September 12, 2017 from Qin
% ======================================================================== %
clear
%restoredefaultpath

%% Set up configure
% Set up
roi_form   = 'nii';
roinum     = 'yes'; % 'yes' or 'no'
radius     = 3;
spm_dir    = '/Users/xujiahua/Documents/MATLAB/spm12';
script_dir = '/Users/xujiahua/Documents/Code/roi_analysis';

% This is the folder which you will save defined ROIs
roi_folder = '/Users/xujiahua/Documents/ROI_24head_1wm1csf';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'LAMY-IFG';
myroi{1}.coords  = [-34,38,8];
myroi{1}.radius  = radius;

myroi{2}.name    = 'LAMY-RACC';
myroi{2}.coords  = [12,-16,34];
myroi{2}.radius  = radius;



myroi{3}.name    = 'LAMY-RACC';
myroi{3}.coords  = [14,-14,34];
myroi{3}.radius  = radius;

myroi{4}.name    = 'LAMY-Frontal_R';
myroi{4}.coords  = [22,18,34];
myroi{4}.radius  = radius;

myroi{5}.name    = 'LAMY-Temporal_Mid_R';
myroi{5}.coords  = [62,-12,-18];
myroi{5}.radius  = radius;

myroi{6}.name    = 'LAMY-Temporal_Mid_L';
myroi{6}.coords  = [-40,-52,12];
myroi{6}.radius  = radius;

myroi{7}.name    = 'LAMY-Cerebelum_4_5_L';
myroi{7}.coords  = [-8,-34,-14];
myroi{7}.radius  = radius;

myroi{8}.name    = 'LAMY-Occipital_Mid_R';
myroi{8}.coords  = [40,-78,-4];
myroi{8}.radius  = radius;

myroi{9}.name    = 'LAMY-Temporal_Sup_R';
myroi{9}.coords  = [40,-4,-14];
myroi{9}.radius  = radius;

myroi{10}.name    = 'RAMY-Precentral_L';
myroi{10}.coords  = [-46,-4,56];
myroi{10}.radius  = radius;

myroi{11}.name    = 'RAMY-Temporal_Sup_R';
myroi{11}.coords  = [44,-36,10];
myroi{11}.radius  = radius;

myroi{12}.name    = 'RAMY-Calcarine_L';
myroi{12}.coords  = [-8,-76,12];
myroi{12}.radius  = radius;

myroi{13}.name    = 'LBLA-RACC';
myroi{13}.coords  = [14,-12,34];
myroi{13}.radius  = radius;

myroi{14}.name    = 'LBLA-RTemporal';
myroi{14}.coords  = [44,-4,-16];
myroi{14}.radius  = radius;

myroi{15}.name    = 'LCMA-RTemporal';
myroi{15}.coords  = [56,12,-10];
myroi{15}.radius  = radius;

myroi{16}.name    = 'LCMA-LFrontal';
myroi{16}.coords  = [-34,50,-4];
myroi{16}.radius  = radius;

myroi{17}.name    = 'LSFA-RFrontal';
myroi{17}.coords  = [50,44,8];
myroi{17}.radius  = radius;

myroi{18}.name    = 'LSFA-RFrontal';
myroi{18}.coords  = [48,44,14];
myroi{18}.radius  = radius;

myroi{19}.name    = 'RBLA-RPrecentral';
myroi{19}.coords  = [52,6,32];
myroi{19}.radius  = radius;

myroi{20}.name    = 'RBLA-RMotor';
myroi{20}.coords  = [14,-2,66];
myroi{20}.radius  = radius;

myroi{21}.name    = 'RBLA-RPariental';
myroi{21}.coords  = [-26,-48,40];
myroi{21}.radius  = radius;

myroi{22}.name    = 'RBLA-RPrecentral';
myroi{22}.coords  = [50,4,30];
myroi{22}.radius  = radius;

myroi{23}.name    = 'RBLA-RTemproral';
myroi{23}.coords  = [46,-40,6];
myroi{23}.radius  = radius;

myroi{24}.name    = 'RCMA-LMotor';
myroi{24}.coords  = [-4,16,54];
myroi{24}.radius  = radius;

myroi{25}.name    = 'RSFA-LFrontal';
myroi{25}.coords  = [-28,40,2];
myroi{25}.radius  = radius;

myroi{26}.name    = 'RSFA-ACC';
myroi{26}.coords  = [8,30,4];
myroi{26}.radius  = radius;
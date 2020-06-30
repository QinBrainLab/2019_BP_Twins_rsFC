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
roi_folder = '/Users/xujiahua/Documents/ROI_0512';

% Define ROIs by specifying name, coordinates and radius
myroi{1}.name    = 'LAMY-Occipital_Mid_R';
myroi{1}.coords  = [42,-78,-4];
myroi{1}.radius  = radius;

myroi{2}.name    = 'LBLA-Frontal-Lobe';
myroi{2}.coords  = [-24,36,10];
myroi{2}.radius  = radius;



myroi{3}.name    = 'LBLA-Temporal_Mid_L ';
myroi{3}.coords  = [-42,-54,10];
myroi{3}.radius  = radius;

myroi{4}.name    = 'LBLA-Hippocampus_L';
myroi{4}.coords  = [-22,-28,-10];
myroi{4}.radius  = radius;

myroi{5}.name    = 'LBLA-Cingulum_Mid_R';
myroi{5}.coords  = [10,-18,36];
myroi{5}.radius  = radius;

myroi{6}.name    = 'LBLA-Temporal_Mid_R';
myroi{6}.coords  = [50,2,-24];
myroi{6}.radius  = radius;

myroi{7}.name    = 'LBLA-Occipital_Mid_R ';
myroi{7}.coords  = [40,-76,6];
myroi{7}.radius  = radius;

myroi{8}.name    = 'RBLA-Occipital_Mid_R';
myroi{8}.coords  = [40,-76,6];
myroi{8}.radius  = radius;

myroi{9}.name    = 'RBLA-Temporal_Sup_R';
myroi{9}.coords  = [42,-38,10];
myroi{9}.radius  = radius;

myroi{10}.name    = 'RBLA-Frontal_Mid_L';
myroi{10}.coords  = [-30,56,0];
myroi{10}.radius  = radius;

myroi{11}.name    = 'RBLA-Occipital_Mid_L ';
myroi{11}.coords  = [-36,-80,0];
myroi{11}.radius  = radius;

myroi{12}.name    = 'RBLA-Temporal_Mid_L';
myroi{12}.coords  = [-40,-48,8];
myroi{12}.radius  = radius;

myroi{13}.name    = 'RBLA-Parietal_Sup_L';
myroi{13}.coords  = [-16,-84,26];
myroi{13}.radius  = radius;

myroi{14}.name    = 'LCMA-SFG';
myroi{14}.coords  = [-30,56,0];
myroi{14}.radius  = radius;

myroi{15}.name    = 'LCMA-HIPL';
myroi{15}.coords  = [-20,-28,-10];
myroi{15}.radius  = radius;

myroi{16}.name    = 'LCMA-TML';
myroi{16}.coords  = [-42,-50,10];
myroi{16}.radius  = radius;

myroi{17}.name    = 'LCMA-PONS';
myroi{17}.coords  = [-6,-28,-30];
myroi{17}.radius  = radius;

myroi{18}.name    = 'RCMA-FIOR';
myroi{18}.coords  = [50,18,28];
myroi{18}.radius  = radius;

myroi{19}.name    = 'RCMA-TSR';
myroi{19}.coords  = [44,-40,12];
myroi{19}.radius  = radius;

myroi{20}.name    = 'RCMA-STG';
myroi{20}.coords  = [64,-46,12];
myroi{20}.radius  = radius;

myroi{21}.name    = 'RCMA-TMR';
myroi{21}.coords  = [41,-78,4];
myroi{21}.radius  = radius;

myroi{22}.name    = 'RCMA-CL';
myroi{22}.coords  = [-4,-84,6];
myroi{22}.radius  = radius;

myroi{23}.name    = 'RCMA-PSL';
myroi{23}.coords  = [-38,-60,58];
myroi{23}.radius  = radius;

myroi{24}.name    = 'LSFA-FITR';
myroi{24}.coords  = [48,36,10];
myroi{24}.radius  = radius;

myroi{25}.name    = 'RSFA-IFG';
myroi{25}.coords  = [-40,24,-4];
myroi{25}.radius  = radius;

myroi{26}.name    = 'RSFA-FL';
myroi{26}.coords  = [-20,28,14];
myroi{26}.radius  = radius;
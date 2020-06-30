clear;clc;
rawpath='/Users/xujiahua/Documents/Code/Imaging_analysis/Data/nifti';
cd(rawpath);
files=dir('20*');
filenames={files.name};
 for i=filenames(1,[2:216])
    datapath=[rawpath filesep i{:}];cd(datapath)
    unix(sprintf('rm *localizer*.nii.gz'))
 end
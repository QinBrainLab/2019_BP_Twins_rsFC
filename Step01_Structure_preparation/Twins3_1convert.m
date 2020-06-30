clear;clc;

load('/Users/xujiahua/Documents/Code/Imaging_analysis/Step1_Structure_preparation/database.mat');
rawpath='/Users/xujiahua/Documents/Code/Imaging_analysis/Data/nifti';
datapath='/Users/xujiahua/Documents/Code/Imaging_analysis/Data/Prep/';
cd(rawpath);
files=dir('20*');
filenames={files.name};
    for i=filenames(1,[1:216])     
       cd(i{:});
    for ii=1:length(database(:,1))     
       subid(ii)=ismember(database{ii,1},i(1,1))
    end
    file_id=database{subid,2};
    S2path1=strcat(datapath,file_id,'/fmri/RS/unnormalized/');
disp('==================================================================');
    fprintf('converting %s',i{:});
    mkdir(S2path1);
    RS='*jiangtainzai*nii.gz';
    S2outpath1=strcat(S2path1,'I.nii.gz');
    %unix(sprintf('fslroi %s %s 10 180',RS,S2outpath1)); 
    unix(sprintf('cp %s %s', RS, S2outpath1))
    S1path1=strcat(datapath,file_id,'/mri/anatomy/');
disp('==================================================================');
    fprintf('converting %s',i{:});
    mkdir(S1path1); 
    T1='co*nii.gz';
    S1outpath1=strcat(S1path1,'I.nii.gz');
    unix(sprintf('cp %s %s',T1,S1outpath1));
    %unix(sprintf('gzip %s',S1outpath1));
    cd('../');
   end
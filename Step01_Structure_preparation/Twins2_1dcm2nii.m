clear;clc;
rawpath='/Users/xujiahua/Documents/Code/Imaging_analysis/Data/raw_data';
cd(rawpath);
files=dir('20*');
filenames={files.name};
 for i=filenames(1,[1:216])
     outpath=strcat('/Users/xujiahua/Documents/Code/Imaging_analysis/Data/nifti/',i{:});
     mkdir(outpath)
     unix(sprintf('dcm2nii -n -g -o %s %s',outpath,i{:})); 
 end
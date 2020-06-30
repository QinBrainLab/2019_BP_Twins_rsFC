%-Configfile for preprocessfmri_qin.m
%__________________________________________________________________________

%subjectlist=import('subjectlist.txt');
paralist.ServerPath = '/Users/xujiahua/Documents/Code/Imaging_analysis/Data/Prep';

%-Subject list
dataid=load('/Users/xujiahua/Documents/Code/Imaging_analysis/Step2_Preprocessing/data_all2.mat');
%1101
paralist.SubjectList =dataid.subjlist
%-Session list
paralist.SessionList = {'RS'};
paralist.sliceorder=[2:2:32 1:2:31];     % Changming Chen 2016-07-30

paralist.InputImgPrefix = '';

%-"v" is the 1st version and "o" is the 2nd version of VolRepair pipeline
%-The entire preprocessing to be completed
%-Choose from: 'swar',  'swavr', 'swaor', 'swgcar',  'swgcavr', 'swgcaor'
%-             'swfar', 'swfavr', 'swfaor', 'swgcfar', 'swgcfavr', 'swgcfaor'
paralist.EntirePipeLine = 'swcar'; %'swcar'

%-Additinal subject list for swgc** pipelines due to better SPGR quality,
% one-to-one matched to paralist.SubjectList
paralist.SPGRSubjectList = '';


%% =================================================
% changes on 2016/07/25 by Changming Chen, sliceorder added as an explicit input parameters, to allow interleaved scanning beyond the script old than 2016/7/25.
% these changes involved: 
% 1) add 'paralist.sliceorder=;' in the file preprocessfmri_congfig.m;
% 2) 'add sliceorder        = paralist.sliceorder;' in preprocessfmri.m;
% 3) change the 'preprocessfmri_slicetime(WholePipeLine, TemplatePath, InputImgFile, FlipFlag, PfileDir, TempDir) into 'preprocessfmri_slicetime(WholePipeLine, TemplatePath, InputImgFile, FlipFlag, PfileDir, TempDir,sliceorder)' in preprocessfmri.m;
% 4) change the 'function preprocessfmri_slicetime (WholePipeLine,TemplatePath, ImgFiles, FlipFlag, PfileDir, OutputDir,sliceorder)' into 'function preprocessfmri_slicetime (WholePipeLine, TemplatePath, ImgFiles, FlipFlag, PfileDir, OutputDir,sliceorder)' in the file preprocessfmri_slicetime.m
% 5) and the following changes in the file peprocesingfmri_slicetime.m
%    matlabbatch{1}.spm.temporal.st.nslices = max(sliceorder);
%    matlabbatch{1}.spm.temporal.st.tr = TR;
%    matlabbatch{1}.spm.temporal.st.ta = TR - TR/max(sliceorder);
%    matlabbatch{1}.spm.temporal.st.refslice =sliceorder(ceiling(length(sliceorder)/2));
%    matlabbatch{1}.spm.temporal.st.so = sliceorder;

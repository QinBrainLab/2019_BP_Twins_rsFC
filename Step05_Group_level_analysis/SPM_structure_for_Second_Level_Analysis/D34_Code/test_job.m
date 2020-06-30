%-----------------------------------------------------------------------
% Job saved on 27-Apr-2020 10:57:24 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.factorial_design.dir = {'/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24Head_1csf_1WM/Analysis/D34'};
load('/Users/xujiahua/Desktop/Twins/database.mat')
dataid=database(:,1)
for ii=1:178
    scans{ii,:}=strcat('/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24Head_1csf_1WM/Left_amygdala_aal/',dataid{ii,1}{:},'.nii,1')
end
matlabbatch{1}.spm.stats.factorial_design.des.mreg.scans = scans;
%%
matlabbatch{1}.spm.stats.factorial_design.des.mreg.mcov.c = cell2mat(database(:,7));
%%
matlabbatch{1}.spm.stats.factorial_design.des.mreg.mcov.cname = 'D34';
matlabbatch{1}.spm.stats.factorial_design.des.mreg.mcov.iCC = 1;
matlabbatch{1}.spm.stats.factorial_design.des.mreg.incint = 1;
%%

matlabbatch{1}.spm.stats.factorial_design.cov(1).c =cell2mat(database(:,8));
%%
matlabbatch{1}.spm.stats.factorial_design.cov(1).cname = 'T34';
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCC = 1;
%%
age=database(:,2)
matlabbatch{1}.spm.stats.factorial_design.cov(2).c =cell2mat(age);
%%
matlabbatch{1}.spm.stats.factorial_design.cov(2).cname = 'AGE4';
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCC = 1;
%%
gender=database(:,4)
matlabbatch{1}.spm.stats.factorial_design.cov(3).c = cell2mat(gender);
%%
matlabbatch{1}.spm.stats.factorial_design.cov(3).cname = 'SEX';
matlabbatch{1}.spm.stats.factorial_design.cov(3).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(3).iCC = 1;

%%

matlabbatch{1}.spm.stats.factorial_design.cov(4).c = cell2mat(database(:,10));
%%
matlabbatch{1}.spm.stats.factorial_design.cov(4).cname = 'LES2';
matlabbatch{1}.spm.stats.factorial_design.cov(4).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(4).iCC = 1;

matlabbatch{1}.spm.stats.factorial_design.cov(5).c = cell2mat(database(:,12));
%%
matlabbatch{1}.spm.stats.factorial_design.cov(5).cname = 'YSR3';
matlabbatch{1}.spm.stats.factorial_design.cov(5).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(5).iCC = 1;


matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'D34';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [0 0 0 0 0 0 1];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;


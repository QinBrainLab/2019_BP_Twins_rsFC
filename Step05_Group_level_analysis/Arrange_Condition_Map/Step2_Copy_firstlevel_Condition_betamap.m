clc;clear;
Raw='/Volumes/xujiahua/Twins/Origin/Seed_based_results/Filtered_24head_1csf_1wm_Right';cd(Raw)
Topath='/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24head_1csf_1wm_Right/Right_Amygdala_aal';mkdir(Topath)
roi='R_Amyg_aal_cytomap'
files=dir('12*');
filenames={files.name};
%alldata={}
for ii=filenames(1,[1:length(files)])
    datapath=[Raw filesep ii{:} filesep 'resting_state' filesep roi filesep 'stats_spm8' filesep 'con_0001.nii']
    tofile=[Topath filesep ii{:} '.nii' ]
    copyfile(datapath,tofile)
        
end
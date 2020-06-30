clc;clear;
datapath='/Volumes/xujiahua/Twins/Origin/Twins_Org/Selected';cd(datapath);
load('/Users/xujiahua/Documents/Code/Seed_WholeBrain_Win/depend/data_all1.mat')
Topath='/Volumes/xujiahua/Twins/Origin/Filtered_24head_1csf_1wm_Right'
subjid=sublist'
for i=subjid(1,[1:178])
    path=[datapath filesep i{:} filesep 'fmri/resting_state']
    Topath1=[Topath filesep i{:}];mkdir(Topath1)
    movefile(path,Topath1)
end
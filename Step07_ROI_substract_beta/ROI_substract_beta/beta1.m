clear;clc;
roi_dir='/Users/xujiahua/Desktop/Twins/ROI/';
cd(roi_dir);
roi_name=dir('*.nii');
name={roi_name.name}
%ind_dir='C:\Users\xujiahua\Desktop\CBD\Step_4_Function_coupling\Data\CMA\All'
%ind_dir='/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24head_1csf_1wm/Left_amygdala_aal'
%ind_dir='/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24head_1csf_1wm_Right/Right_Amygdala_aal'
%ind_dir='/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24head_1csf_1wm_subregions/RSF'
%ind_dir='/Volumes/xujiahua/Twins/CONN/Seed_based_arrange/Filtered_AAL/Left_amygdala_aal'
%ind_dir='/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24head_1csf_1wm/Left_amygdala_aal'
%ind_dir='/Volumes/xujiahua/Twins/Origin/Arrange_confile_filtered_24head_1csf_1wm_subregions/LLB'
ind_dir='/Volumes/xujiahua/Twins/Origin/fALFF/WholeBrain/Results/ALFF_FunImgARCWDC'
cd(ind_dir);
ind_name=dir('za*.nii');
for i=1:length(ind_name) 
    sub=ind_name(i,1).name;
    for j=1:length(roi_name) 
        roi=[roi_dir,roi_name(j,1).name];
        beta(i,j) = rex(sub,roi);
    end
end
%%Newly Written 
id={ind_name.name}'

for kk=1:length(id)
    id2=id{kk,1}
    subs1{kk,1}=id2(1:[length(id2)-4])
end
%subs={ind_name.name}';
head=['id',name]
beta2=num2cell(beta)
Dataall=[head;subs1,beta2]

cd(roi_dir);
%save Activation_Children beta subs1
Filename=[roi_dir,'WholeBrainzALFF.csv'];
cell2csv(Filename,Dataall);

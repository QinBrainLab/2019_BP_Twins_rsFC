clc;clear;
load('/Volumes/xujiahua/Twins/Origin/SeedToSeed/Results_180/Group_swcar_network_23ROIs_wm_csf_mvmnt_eigen1.mat')
LAMY=GroupMatrix(:,5,:)
RAMY=GroupMatrix(:,8,:)
Lamy2=reshape(LAMY,[8,length(RAMY)])
Ramy2=reshape(RAMY,[8,length(RAMY)])
subnum=length(RAMY)
Raw=Lamy2'
for ii=1:4
    for kk=1:subnum
        DataLAMY(kk,ii)=0.5*log((1+Lamy2(ii,kk))/(1-Lamy2(ii,kk)));
    end
end


for ii=6:7
    for kk=1:subnum
        DataRAMY(kk,ii)=0.5*log((1+Ramy2(ii,kk))/(1-Ramy2(ii,kk)));
    end
end
% for ii=1:40
% IFG=Lamy2(1,:)'
% IFGNew(ii,1)=0.5*log((1+IFG(ii,1))/(1-IFG(ii,1)));
% 
% 
% 
% LACC=Lamy2(2,:)'
% LACCnew(ii,1)=0.5*log((1+LACC(ii,1))/(1-LACC(ii,1)));
% MTG=Lamy2(3,:)'
% MTGNew(ii,1)=0.5*log((1+MTG(ii,1))/(1-LACC(ii,1)));
% RACC=Lamy2(4,:)'
% RAMYIFG=Ramy2(6,:)'
% RAMYPreCG=Ramy2(7,:)'
% 
% 
% end

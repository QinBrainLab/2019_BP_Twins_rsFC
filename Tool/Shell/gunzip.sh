DATAROOT='/Volumes/xujiahua/Twins/Origin/fALFF/FunImgARCW'
cd $DATAROOT
for i in 1*
do
gunzip $DATAROOT/$i/swcarI.nii.gz
#gunzip $DATAROOT/$i/fmri/recog1/unnormalized/I.nii.gz
#gunzip $DATAROOT/$i/mri/anatomy/I.nii.gz
#gunzip $DATAROOT/$i/fmri/RS/smoothed_spm8/swcarI.nii.gz
#gunzip $DATAROOT/$i/mri/anatomy/I.nii.gz
done
